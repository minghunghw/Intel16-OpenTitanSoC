##############################################################################
# MergeLibraries.pm
#
# A plugin which is called after all modifications are complete on the
# libraries, and it merges libraries with their sub-libraries into a single
# entity.
#
#
##############################################################################
package MergeLibraries;
use strict;
use warnings;

use emubuild::common::Plugins;

use RTLUtils;
use Utils;
use Data::Dump;
use Hash::Merge;


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

    # Register the merge_libraries function for callback after every platform
    # stage. This, however, does nothing except after modify_metadata.
    &emubuild::common::Plugins::RegisterForEvent(
        'PostRunPlatform', # USER: Name of Event
        \&merge_libraries, # USER: Local function to call
        $plugin_self,
        $plugin_self->{Name});
    return $plugin_self;
}


##############################################################################
# merge_sublib
#
# Recursively descends the entries to produce a final table of all merged
# libraries.
##############################################################################
sub merge_sublib {
    my $plugin_self = shift;
    my %args = (
        instance => undef,
        local_umd_ref => undef,
        lib_name => undef,
        lib_ref => undef,
        sublibs => undef,
        @_,
    );

    my $self = $args{instance};
    my $local_umd_ref = $args{local_umd_ref};
    my $lib_name = $args{lib_name};
    my $lib_ref = $args{lib_ref};
    my @sublibs = @{$args{sublibs}};

    my $merge = Hash::Merge->new('LEFT_PRECEDENT');
    foreach my $sublib (@sublibs) {
        my $sublib_ref = $local_umd_ref->{LIBRARIES}->{$sublib};

        # Recursively descend to the next level down and collect its
        # sub-libraries together.
        if ($sublib_ref) {
            my @sub_sublibs = @{$sublib_ref->{SUBLIBS}};
            if (@sub_sublibs) {
                $sublib_ref = $plugin_self->merge_sublib(
                    instance => $self,
                    local_umd_ref => $local_umd_ref,
                    lib_name => $sublib,
                    lib_ref => $sublib_ref,
                    sublibs => \@sub_sublibs);
            }
        } else {
            print_warning("Unable to merge $sublib into $lib_name");
        }

        # Merge this sub-lib with the current library
        eval {
            local $SIG{__DIE__};
            $lib_ref = $merge->merge($lib_ref, $sublib_ref);
        };

        delete $local_umd_ref->{LIBRARIES}->{$sublib};
        delete $local_umd_ref->{LIBRARY_MAPPING}->{$sublib};

        # Remove the library into the order if it exists
        my @new_order = grep(!/^$sublib$/, @{$local_umd_ref->{LIBRARY_ORDER}});
        $local_umd_ref->{LIBRARY_ORDER} = \@new_order;

        # Reset the library reference and clear out the SUBLIBS from it
        $lib_ref->{SUBLIBS} = [];
    }

    return $lib_ref;
}


##############################################################################
# merge_all_libraries
#
# Walks all the libraries in the UMD and mergees all sub-libraries into the
# main library.
##############################################################################
sub merge_all_libraries {
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
        my @sublibs = @{$entry_ref->{SUBLIBS}};

        if (@sublibs) {
            $entry_ref = $plugin_self->merge_sublib(
                instance => $self,
                local_umd_ref => \%local_umd,
                lib_name => $lib,
                lib_ref => $entry_ref,
                sublibs => \@sublibs);
            $local_umd{LIBRARIES}->{$lib} = $entry_ref;
        }
    }

    # After merging all the libraries, since we're in the modify_metadata
    # stage, call its finalize_entries function to remove any duplicates.
    $self->finalize_entries(
        local_yml_query => $args{local_yml_query},
        local_umd => \%local_umd);

    # Replace the modified UMD with the merged copy
    $status |= &emubuild::common::Utils::serialize_umd(
        $umd_file,
        \%local_umd);

    return $status;
}


##############################################################################
# user_library_mapping
#
# Map libraries based on user's given values. There is no ordering guaranteed,
# since the input is a hash.
##############################################################################
sub user_library_mapping {
    my $plugin_self = shift;
    my %args = (
        instance => undef,
        cfg_name => undef,
        local_yml_query => undef,
        @_,
    );

    my $self = $args{instance};
    my $cfg_name = $args{cfg_name};
    my $local_yml_query = $args{local_yml_query};
    my $status = 0;

    # Get a copy of the modified UMD
    my $umd_file = $self->get_scoped_var('data_path') . "/" . ${cfg_name} . "/" . $emubuild::common::Constants::MODIFIED_UMD;
    my $umd_ref = &emubuild::common::Utils::deserialize_umd(
        $umd_file);
    &emubuild::common::Utils::fatal_print("Failure to get modified UMD, unable to continue") if (!defined $umd_ref);
    my %local_umd = %{Clone::clone($umd_ref)};

    my %user_level_map = $local_yml_query->get_hash("USER:MERGE_LIBRARIES_MAP");
    foreach my $lib (keys %user_level_map) {
        my $entry_ref = $local_umd{LIBRARIES}->{$lib};
        my @libs_to_merge = $local_yml_query->get_array("USER:MERGE_LIBRARIES_MAP:" . $lib);

        if (@libs_to_merge) {
            if (!$entry_ref) {
                # Add the new entry because it did not exist before
                my %entry = %{&Clone::clone(\%emubuild::common::Constants::ENTRY_INITIAL)};

                $entry{ACETAG} = $emubuild::common::Constants::USER_LIBRARY_ACETAG;
                $local_umd{LIBRARY_MAPPING}{$lib} = $lib;
                $local_umd{LIBRARIES}{$lib} = \%entry;

                # Add the library into the order if it does not exist
                if (!grep(/^$lib$/, @{$local_umd{LIBRARY_ORDER}})) {
                    push(@{$local_umd{LIBRARY_ORDER}}, $lib);
                }
                $entry_ref = \%entry;
            }

            # Concept of merging sublibraries or any arbitary library together is really
            # the same.
            $entry_ref = $plugin_self->merge_sublib(
                instance => $self,
                local_umd_ref => \%local_umd,
                lib_ref => $entry_ref,
                sublibs => \@libs_to_merge);
            $local_umd{LIBRARIES}->{$lib} = $entry_ref;
        }
    }

    # After merging all the libraries, since we're in the modify_metadata
    # stage, call its finalize_entries function to remove any duplicates and
    # also make sure the workdirs are set properly.
    $self->finalize_workdir(
        local_umd => \%local_umd);
    $self->finalize_entries(
        local_yml_query => $local_yml_query,
        local_umd => \%local_umd);

    # Replace the modified UMD with the merged copy
    $status |= &emubuild::common::Utils::serialize_umd(
        $umd_file,
        \%local_umd);

    return $status;
}


##############################################################################
# merge_libraries
#
# Looks up the name of the stage in question, as well as checking to see
# if it is enabled in the USER section of the YML file.
##############################################################################
sub merge_libraries {
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

    # Handle sub-library merging
    my $merge_libraries = $local_yml_query->get_scalar("USER:MERGE_LIBRARIES") // "NO";
    if ($merge_libraries =~ m/^YES$/) {
        $status |= $plugin_self->merge_all_libraries(
            instance => $self,
            cfg_name => $cfg_name,
            local_yml_query => $local_yml_query);
    }

    # Handle full-library merging by user control
    if ($local_yml_query->has_field("USER:MERGE_LIBRARIES_MAP")) {
        $status |= $plugin_self->user_library_mapping(
            instance => $self,
            cfg_name => $cfg_name,
            local_yml_query => $local_yml_query);
    }

    return $status;
}


# do not delete:
1;
