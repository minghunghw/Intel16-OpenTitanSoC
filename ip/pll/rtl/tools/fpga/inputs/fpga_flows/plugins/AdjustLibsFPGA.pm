##############################################################################
# AdjustLibsFPGA.pm
#
# A plugin which is called after all modifications are complete on the
# libraries, and it goes through all the libdirs and adds the files as src
# files.
#
# A second hook also converts any libs entries directly as src files.
#
# RTL_CHANGES is not applied to these files
#
#
##############################################################################
package AdjustLibsFPGA;
use strict;
use warnings;

use emubuild::common::Plugins;

use RTLUtils;
use Utils;
use Data::Dump;
use Hash::Merge;
use Path::Class;


##############################################################################
# new
#
# Creates this plugin object and registers it for the framework with its
# particular resulting callback function on a particular set of events.
# Most of this function does not need to be changed by user, except
# for registering the event to function.
##############################################################################
sub new {
    # This code at the top is always the same, and required for the framework.
    my ($type, %options) = @_;
    my $plugin_self      = ();
    $plugin_self->{Name} = $type;
    bless($plugin_self, $type);

    # Register the adjust_files_from_libs function for callback after every
    # stage. This, however, does nothing except after modify_metadata.
    &emubuild::common::Plugins::RegisterForEvent(
        'PostRunPlatform', # USER: Name of Event
        \&adjust_files_from_libs, # USER: Local function to call
        $plugin_self,
        $plugin_self->{Name});
    return $plugin_self;
}


##############################################################################
# add_files
#
# Adds files from the libdir as source files, apply some pruning logic and
# those that remain add.
##############################################################################
sub add_files {
    my $plugin_self = shift;
    my %args = (
        instance => undef,
        local_umd_ref => undef,
        local_yml_query => undef,
        lib_name => undef,
        lib_ref => undef,
        libdir => undef,
        @_,
    );

    my $self = $args{instance};
    my $local_umd_ref = $args{local_umd_ref};
    my $lib_name = $args{lib_name};
    my $lib_ref = $args{lib_ref};
    my $libdir = $args{libdir};

    # Calculate the files users are forcing to exclude or include
    my $local_yml_query = $args{local_yml_query};
    my @exclude_regex = $local_yml_query->get_array("USER:MINE_LIBDIRS_EXCLUDE");
    my @include_regex = $local_yml_query->get_array("USER:MINE_LIBDIRS_INCLUDE");

    if (-d $libdir) {
        foreach my $libext (@{$local_umd_ref->{LIBRARIES}->{$lib_name}->{VERILOG}->{LIBEXT}}) {
            my @add_files = `find $libdir -name \"*$libext\"`;
            chomp(@add_files);

            # Prune the files based on the following criteria, check for number of modules
            # within the file. If it's > 1 or 1 and does not match the filename, then keep it.
            foreach my $add_file (@add_files) {
                my $should_add = undef;
                my $basename = file($add_file)->basename;

                foreach my $pattern (@include_regex) {
                    if ($basename =~ m/$pattern/) {
                        $should_add = 1;
                        last;
                    }
                }
                foreach my $pattern (@exclude_regex) {
                    if ($basename =~ m/$pattern/) {
                        $should_add = 0;
                        last;
                    }
                }

                # If not being included or excluded by user arbitrarily, then run the logic
                # to determine whether or not to include the file.
                if (!defined $should_add) {
                    if (my $add_fh = &RTL_fopen("<", $add_file)) {
                        my @lines = <$add_fh>;
                        @lines = grep(/^\s*module\s+(\S+)/, @lines);

                        if (@lines > 1) {
                            print_info("Mined library file $add_file because it contains multiple modules");
                            $should_add = 1;
                        } else {
                            $lines[0] =~ m/^\s*module\s+(\S+)/;
                            my $module_name = $1;
                            if ($basename !~ m/${module_name}${libext}/) {
                                print_info("Mined library file $add_file because contained module $module_name does not match file name $basename");
                                $should_add = 1;
                            }
                        }
                        close $add_fh;
                    } else {
                        &emubuild::common::Utils::error_print("Unable to open $add_file for reading");
                    }
                }

                if ($should_add) {
                    push($local_umd_ref->{LIBRARIES}->{$lib_name}->{VERILOG}->{FILES}, $add_file);
                }
            }
        }
    } else {
        &emubuild::common::Utils::error_print("$libdir doesn't exist, can't mine it for files");
    }

}


##############################################################################
# libs_as_files
#
# Walks all the libraries in the UMD and converts libs into files sections.
# This is an all or nothing flag, with no exception functionality, since it's
# really a work-around for a lack of feature in Protocompiler.
##############################################################################
sub libs_as_files {
    my $plugin_self = shift;
    my %args = (
        instance => undef,
        cfg_name => undef,
        local_yml_query => undef,
        @_,
    );

    my $self = $args{instance};
    my $cfg_name = $args{cfg_name};
    my $status = 0;

    # Get a copy of the modified UMD
    my $umd_file = $self->get_scoped_var('data_path') . "/" . ${cfg_name} . "/" . $emubuild::common::Constants::MODIFIED_UMD;
    my $umd_ref = &emubuild::common::Utils::deserialize_umd(
        $umd_file);
    &emubuild::common::Utils::fatal_print("Failure to get modified UMD, unable to continue") if (!defined $umd_ref);
    my %local_umd = %{Clone::clone($umd_ref)};

    # Push library files at end of list of files, and clear out libraries
    foreach my $lib (@{$local_umd{LIBRARY_ORDER}}) {
        my $entry_ref = $local_umd{LIBRARIES}->{$lib};
        my @libs = @{$entry_ref->{VERILOG}->{LIBS}};
        push($local_umd{LIBRARIES}->{$lib}->{VERILOG}->{FILES}, @libs);
        $local_umd{LIBRARIES}->{$lib}->{VERILOG}->{LIBS} = [];
    }

    # After mining all the libdirs, since we're in the modify_metadata
    # stage, call its finalize_entries function to remove any duplicates.
    $self->finalize_entries(
        local_umd => \%local_umd,
        local_yml_query => $args{local_yml_query});

    # Replace the modified UMD with the merged copy
    $status |= &emubuild::common::Utils::serialize_umd(
        $umd_file,
        \%local_umd);

    return $status;
}

##############################################################################
# mine_all_libdirs
#
# Walks all the libraries in the UMD and finds libdirs.
##############################################################################
sub mine_all_libdirs {
    my $plugin_self = shift;
    my %args = (
        instance => undef,
        cfg_name => undef,
        local_yml_query => undef,
        @_,
    );

    my $self = $args{instance};
    my $cfg_name = $args{cfg_name};
    my $status = 0;

    # Get a copy of the modified UMD
    my $umd_file = $self->get_scoped_var('data_path') . "/" . ${cfg_name} . "/" . $emubuild::common::Constants::MODIFIED_UMD;
    my $umd_ref = &emubuild::common::Utils::deserialize_umd(
        $umd_file);
    &emubuild::common::Utils::fatal_print("Failure to get modified UMD, unable to continue") if (!defined $umd_ref);
    my %local_umd = %{Clone::clone($umd_ref)};

    foreach my $lib (@{$local_umd{LIBRARY_ORDER}}) {
        my $entry_ref = $local_umd{LIBRARIES}->{$lib};
        my @libdirs = @{$entry_ref->{VERILOG}->{LIBDIRS}};
        foreach my $libdir (@libdirs) {
            $plugin_self->add_files(
                instance => $self,
                local_umd_ref => \%local_umd,
                local_yml_query => $args{local_yml_query},
                lib_name => $lib,
                lib_ref => $entry_ref,
                libdir => $libdir);
        }
    }

    # After mining all the libdirs, since we're in the modify_metadata
    # stage, call its finalize_entries function to remove any duplicates.
    $self->finalize_entries(
        local_umd => \%local_umd,
        local_yml_query => $args{local_yml_query});

    # Replace the modified UMD with the merged copy
    $status |= &emubuild::common::Utils::serialize_umd(
        $umd_file,
        \%local_umd);

    return $status;
}


##############################################################################
# adjust_files_from_libs
#
# Looks up the name of the stage in question, as well as checking to see
# if it is enabled in the USER section of the YML file. This hooks into two
# behaviors, one for mining files from LIBDIRS, and one for converting
# LIBS given into files.
##############################################################################
sub adjust_files_from_libs {
    my $plugin_self = shift;
    my $event = shift;
    my %args = (
        instance => undef,
        @_,
    );

    # Because we have the actual instance as self, we are able to
    # treat usage of this basically like being inside the stage. This is
    # both powerful and dangerous.
    my $status = 0;
    my $self = $args{instance};
    my $cfg_name = $self->get_opt('cfg_name');

    # Split the configuration and stage name out from the combined value.
    $self->{inst_name} =~ m/${cfg_name}_(.*)/;
    my $stage_name = $1;

    # Leave early if we're not at the end of modifying metadata
    if ($stage_name !~ m/modify_metadata/) {
        return $status;
    }

    # Get the table of configuration information
    my %cfg_data_table = %{$self->get_scoped_var('cfg_data_table')};
    my $local_yml_query = $cfg_data_table{$cfg_name}{YML};

    # Handle libdir mining
    my $mine_libdirs = $local_yml_query->get_scalar("USER:MINE_LIBDIRS") // "NO";
    if ($mine_libdirs =~ m/^YES$/) {
        $status |= $plugin_self->mine_all_libdirs(
            instance => $self,
            cfg_name => $cfg_name,
            local_yml_query => $local_yml_query);
    }

    # Handle converting LIBS sections into files
    my $libs_as_files = $local_yml_query->get_scalar("USER:LIBS_AS_FILES") // "NO";
    if ($libs_as_files =~ m/^YES$/) {
        $status |= $plugin_self->libs_as_files(
            instance => $self,
            cfg_name => $cfg_name,
            local_yml_query => $local_yml_query);
    }

    return $status;
}


# do not delete:
1;
