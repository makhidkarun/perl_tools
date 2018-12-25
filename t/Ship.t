# t/Ship.t
#
use 5.008;
use strict;
use warnings;
use Test::More;
use lib 'lib';
use Ship qw ( required_engineers );

BEGIN {
    use_ok( 'Ship' ) || print "Bail out!\n";
}

diag( "Testing Ship $Ship::VERSION, Perl $], $^X" );

ok(required_engineers(1) == 1, "Wrong number for 1 drive ton.");

done_testing();

