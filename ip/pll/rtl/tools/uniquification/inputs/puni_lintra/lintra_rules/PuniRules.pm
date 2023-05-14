package PuniRules;

use strict;
use warnings;

sub InitializePuniRules
{
   my $rule_group = "PuniRules";
   perllintra::lintra_create_group($rule_group);
   perllintra::lintra_create_udr ("puni", 
                                  "", 
                                  "", 
                                  "Error",
                                  0,
                                  $rule_group
                                  );
}

return 1;
