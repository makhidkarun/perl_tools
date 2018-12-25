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

my @ship_data = split /:/, "Miss Rosa:400:2:3:200:4:50:Trip_Beam, Trip_Pulse, Trip_Pulse,     Trip_Miss";
my $ship          = Ship->new(\@ship_data);

ok($ship->required_engineers() == 2, "Should be 2, wrong number for 50 ton drive.");

done_testing();

