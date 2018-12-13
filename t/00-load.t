#!perl -T
use 5.008;
use strict;
use warnings;
use Test::More;
use lib 'lib';

plan tests => 1;

BEGIN {
    use_ok( 'Dice' ) || print "Bail out!\n";
}

diag( "Testing Dice $Dice::VERSION, Perl $], $^X" );
