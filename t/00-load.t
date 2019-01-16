#!perl -T
use 5.008;
use strict;
use warnings;
use Test::More;
use lib 'lib';

plan tests => 1;

BEGIN {
    use_ok( 'FTL_FleetOps::Dice' ) || print "Bail out!\n";
}

diag( "Testing Dice $FTL_FleetOps::Dice::VERSION, Perl $], $^X" );
