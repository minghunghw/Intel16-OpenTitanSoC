#!/usr/intel/bin/perl -w

package security;

use vars qw (%agent_encoding);
%agent_encoding = (
    #specify agent names and enumerated bit values for access list
    "SAI_RESERVED_0"		=> 0,
    "SAI_RESERVED_1"		=> 1,
    "SAI_RESERVED_2"		=> 2,
    "SAI_RESERVED_3"		=> 3,
    "SAI_RESERVED_4"		=> 4,
    "SAI_RESERVED_5"		=> 5,
    "SAI_RESERVED_6"		=> 6,
    "SAI_RESERVED_7"		=> 7,
    "SAI_RESERVED_8"		=> 8,
    "SAI_RESERVED_9"		=> 9,
    "SAI_RESERVED_10"		=> 10,
    "SAI_RESERVED_11"		=> 11,
    "SAI_RESERVED_12"		=> 12,
    "SAI_RESERVED_13"		=> 13,
    "SAI_RESERVED_14"		=> 14,
    "SAI_RESERVED_15"		=> 15,
    "SAI_RESERVED_16"		=> 16,
    "SAI_RESERVED_17"		=> 17,
    "SAI_RESERVED_18"		=> 18,
    "SAI_RESERVED_19"		=> 19,
    "SAI_RESERVED_20"		=> 20,
    "SAI_RESERVED_21"		=> 21,
    "SAI_RESERVED_22"		=> 22,
    "SAI_RESERVED_23"		=> 23,
    "SAI_RESERVED_24"		=> 24,
    "SAI_RESERVED_25"		=> 25,
    "SAI_RESERVED_26"		=> 26,
    "SAI_RESERVED_27"		=> 27,
    "SAI_RESERVED_28"		=> 28,
    "SAI_RESERVED_29"		=> 29,
    "SAI_RESERVED_30"		=> 30,
    "SAI_RESERVED_31"		=> 31,
    "SAI_RESERVED_32"		=> 32,
    "SAI_RESERVED_33"		=> 33,
    "SAI_RESERVED_34"		=> 34,
    "SAI_RESERVED_35"		=> 35,
    "SAI_RESERVED_36"		=> 36,
    "SAI_RESERVED_37"		=> 37,
    "SAI_RESERVED_38"		=> 38,
    "SAI_RESERVED_39"		=> 39,
    "SAI_RESERVED_40"		=> 40,
    "SAI_RESERVED_41"		=> 41,
    "SAI_RESERVED_42"		=> 42,
    "SAI_RESERVED_43"		=> 43,
    "SAI_RESERVED_44"		=> 44,
    "SAI_RESERVED_45"		=> 45,
    "SAI_RESERVED_46"		=> 46,
    "SAI_RESERVED_47"		=> 47,
    "SAI_RESERVED_48"		=> 48,
    "SAI_RESERVED_49"		=> 49,
    "SAI_RESERVED_50"		=> 50,
    "SAI_RESERVED_51"		=> 51,
    "SAI_RESERVED_52"		=> 52,
    "SAI_RESERVED_53"		=> 53,
    "SAI_RESERVED_54"		=> 54,
    "SAI_RESERVED_55"		=> 55,
    "SAI_RESERVED_56"		=> 56,
    "SAI_RESERVED_57"		=> 57,
    "SAI_RESERVED_58"		=> 58,
    "SAI_RESERVED_59"		=> 59,
    "SAI_RESERVED_60"		=> 60,
    "SAI_RESERVED_61"		=> 61,
    "SAI_RESERVED_62"		=> 62,
    "SAI_RESERVED_63"		=> 63,

);


sub GetUnsupportedInfo() {
    my %security = (

    );
    return (%security);
};

sub GetSecurityInfo() {
    my %security = (

    );
    return (%security);
};

sub GetSecurityUnsupportedInfo() {
    my %security = (

    );
    return (%security);
};

sub agent2hex {
    my $agentstr = shift;
    my $offset = shift;
    my $bits = shift;
    my $retval = 0;
    if( $agentstr =~ /^\d[0-9a-fA-FxX_]*$/ ) {
        # constant
        $retval = oct( $agentstr );
    } else {
        if( !exists($agent_encoding{$agentstr}) ) {
            print "-E- unknown agent encoding: $agentstr\n";
        }
        my $shift = $agent_encoding{$agentstr};
        if( ($offset <= $shift) && ($shift < ($offset + $bits)) ) {
            $retval = (1 << ($shift - $offset));
        }
    }
    return( $retval );
}

## str2hex handles normal 32-bit SAI values
sub str2hex {
    my $instring = shift;
    $instring =~ s/\s+//g;
    $instring =~ s/\"//g;
    my @agent_list = split(/\|/, $instring);
    my $vector_val = 0;
    foreach my $a (@agent_list) {
        chomp($a);
        $vector_val = $vector_val | agent2hex($a, 0, 32);
    }
    my $vector_val_hex = sprintf "%lx", $vector_val;
    $vector_val_hex = "32'h" . $vector_val_hex;
    return ($vector_val_hex);
}

## str2hex64 handles full 64-bit SAI values
sub str2hex64 {
    my $instring = shift;
    $instring =~ s/\s+//g;
    $instring =~ s/\"//g;
    my @agent_list = split(/\|/, $instring);
    my $vector_val = 0;
    foreach my $a (@agent_list) {
        chomp($a);
        $vector_val = $vector_val | agent2hex($a, 0, 64);
    }
    my $vector_val_hex = sprintf "%llx", $vector_val;
    $vector_val_hex = "64'h" . $vector_val_hex;
    return ($vector_val_hex);
}

=c
sub str2hex64 {
    use Math::BigInt lib => 'GMP';

    my $instring = shift;  
    $instring =~ s/\s+//g;    
    $instring =~ s/\"//g;     
    my @agent_list = split(/\|/, $instring);   
    my $vector_val = Math::BigInt->new($str);
    foreach my $a (@agent_list) {
        chomp($a);
        if( $a =~ /^\d[0-9a-fA-FxX_]*$/ ) {
            # constant
            $vector_val->badd(oct( $a ));
        } else {
            if( !exists($agent_encoding{$a}) ) {
                print "-E- unknown agent encoding: $a\n";
            }
            my $shift = $agent_encoding{$a};
            my $oneshift = Math::BigInt->bone();
            $oneshift->blsft($shift);
            $vector_val->badd($oneshift);
        }
    }
    my $vector_val_hex = $vector_val->as_hex();
    my $vector_val_hex_verilog = "64'h" . $vector_val_hex;
    $vector_val_hex_verilog =~ s/0x//;
    return ($vector_val_hex_verilog);
}
=cut
## str2hex_upper32 returns upper 32-bits of a 64-bit SAI vector
sub str2hex_upper32 {
    my $instring = shift;
    $instring =~ s/\s+//g;
    $instring =~ s/\"//g;
    my @agent_list = split(/\|/, $instring);
    my $vector_val = 0;
    foreach my $a (@agent_list) {
        chomp($a);
        $vector_val = $vector_val | agent2hex($a, 32, 32);
    }
    my $vector_val_hex = sprintf "%lx", $vector_val;
    $vector_val_hex = "32'h" . $vector_val_hex;
    return ($vector_val_hex);
}

## str2hex_lower32 returns lower 32-bits of a 64-bit SAI vector
sub str2hex_lower32 {
    my $instring = shift;
    $instring =~ s/\s+//g;
    $instring =~ s/\"//g;
    my @agent_list = split(/\|/, $instring);
    my $vector_val = 0;
    foreach my $a (@agent_list) {
        chomp($a);
        $vector_val = $vector_val | agent2hex($a, 0, 32);
    }
    my $vector_val_hex = sprintf "%lx", $vector_val;
    $vector_val_hex = "32'h" . $vector_val_hex;
    return ($vector_val_hex);
}


sub str2hex_byte {
    my ($instring, $instring2) = @_;
    
    $instring =~ s/\s+//g;
    $instring =~ s/\"//g;
    my $offset = 0;
    #print("\n".$instring2."\n");
    #$instring2 = int(instring2);
    #print("\n".$instring2."\n");
    my @agent_list = split(/\|/, $instring);
    my $vector_val = 0;
    foreach my $a (@agent_list) {
        chomp($a);
        # vmp: Modifying to keep it for 8-bit as DP supports maximum byte
        #      boundary register specification
        #my $shift = $agent_encoding{$a};
        #$shift = $agent_encoding{$a}%8;
        #$vector_val = $vector_val | (1<<$shift);
        $vector_val = $vector_val | agent2hex($a, 0, 64);
    }
    my $vector_val_hex = sprintf "%016x", $vector_val;
    #print("\n".$vector_val_hex."\n");
    $offset = (15-($instring2*2+1));
    $vector_val_hex = substr $vector_val_hex, $offset, 2;
    #print("\n".$offset."\n".$vector_val_hex."\n\n");
    $vector_val_hex = "8'h".$vector_val_hex;
    return ($vector_val_hex);
}

sub str2hex_msb {
    return str2hex_upper32(@_);
}
sub str2hex_lsb {
    return str2hex_lower32(@_);
}

sub get_type {
    if ((($_[0] >> $_[1])%2) == 1) {
        return "RW";
    }
    else {
        return "RO";
    }
}

sub get_value {
    if ($_[0] eq "RW") {
        return (($_[1] >> $_[2])%2);
    }  else {
        return 0;
    }
}
sub policybit_get_type {
    my $vector_val = $_[0];
    $vector_val =~ s/64'h//g;
    my $vector_val_dec = hex($vector_val);
    if ((($vector_val_dec >> $_[1])%2) == 1) {
        return "RO";
    }
    else {
        return "RW";
    }
}

sub policybit_get_value {
    my $vector_val = $_[1];
    $vector_val =~ s/64'h//g;
    my $vector_val_dec = hex($vector_val);
    if ($_[0] eq "RW") {
        return (($vector_val_dec >> $_[2])%2);
    } elsif ($_[0] eq "RO") {
        return (($vector_val_dec >> $_[2])%2);
    } else {
        return 0;
    }
}

1;
