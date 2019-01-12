# t/FTL_FleetOps/Ship.t
#
use 5.008;
use strict;
use warnings;
use Test::More;
use lib 'lib';
use FTL_FleetOps::Ship;

BEGIN {
    use_ok( 'FTL_FleetOps::Ship' ) || print "Bail out!\n";
}

diag( "Testing Ship $FTL_FleetOps::Ship::VERSION, Perl $], $^X" );

my %ship_data = ( _name => 'Miss Rosa',
  _hull_size => 400,
  _jump      => 2,
  _maneuver  => 3,
  _max_cargo => 200,
  _max_pass  => 4,
  _drive_ton => 50,
  _weapons   => 'Trip_Beam, Trip_Pulse, Trip_Pulse, Trip_Miss',
);

my $ship                = FTL_FleetOps::Ship->new(\%ship_data);
ok($ship->min_engineers == 2, "Should have 2 engineers for 50 ton drive");
ok($ship->name          eq 'Miss Rosa', "Ship name should be 'Miss Rosa'.");
ok($ship->hull_size     == 400, "Ship hull size should be 400.");
ok($ship->jump          == 2, "Ship jump should be 2.");
ok($ship->maneuver      == 3, "Ship maneuver should be 3.");
ok($ship->max_cargo     == 200, "Ship max_cargo should be 200.");
ok($ship->max_pass      == 4, "Ship max_pass should be 4.");
ok($ship->drive_ton     == 50, "Ship drive_ton should be 50.");
ok($ship->weapons       eq 'Trip_Beam, Trip_Pulse, Trip_Pulse, Trip_Miss', 
  "Ship weapons should be 'Trip_Beam, Trip_Pulse, Trip_Pulse, Trip_Miss'.");

done_testing();

