#!perl -T
use 5.008;
use strict;
use warnings;
use Test::More;
use lib 'lib';

use FTL_FleetOps::Crew;

plan tests => 1;

BEGIN {
    use_ok( 'FTL_FleetOps::Crew' ) || print "Bail out!\n";
}

diag( "Testing Crew $FTL_FleetOps::Crew::VERSION, Perl $], $^X" );

done_testing();

