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

my %ship_data = ( 
  name => 'Miss Rosa',
  hull_size => 400,
  jump      => 2,
  maneuver  => 3,
  max_cargo => 200,
  max_pass  => 4,
  drive_ton => 50,
  weapons   => 'Trip_Beam, Trip_Pulse',
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
ok($ship->weapons       eq 'Trip_Beam, Trip_Pulse', 
  "Ship weapons should be 'Trip_Beam, Trip_Pulse'.");
ok($ship->min_gunners   == 2, "Should have one gunner per weapon.");
ok($ship->min_medic     == 1, "Should have one medic if hull greater than 200 dT.");

# Do the default attributes work?
my $ship_default                = FTL_FleetOps::Ship->new();
ok($ship_default->min_engineers == 1, "Should have 1 engineer for 20 ton drive");
ok($ship_default->name          eq '', "Ship name should be empty.");
ok($ship_default->hull_size     == 100, "Ship hull size should be 100.");
ok($ship_default->jump          == 1, "Ship jump should be 1.");
ok($ship_default->maneuver      == 1, "Ship maneuver should be 1.");
ok($ship_default->max_cargo     == 0, "Ship max_cargo should be 0.");
ok($ship_default->max_pass      == 0, "Ship max_pass should be r04.");
ok($ship_default->drive_ton     == 20, "Ship drive_ton should be 20.");
ok($ship_default->weapons       eq '', "Ship weapons should be empty.");
ok($ship_default->min_gunners   == 0, "Should have no gunners.");
ok($ship_default->min_medic     == 0, "Should only have a medic if hull greater than 200 dT.");

# Does the Ship allow changed attributes?
# Are changed attributes used for evaluation?
my $ship_default_change                 = FTL_FleetOps::Ship->new();
$ship_default_change->drive_ton( 50 );
ok($ship_default_change->drive_ton      == 50, "Should have 50 tons of drive.");
ok($ship_default_change->min_engineers  == 2, "Should have 2 engineers for 50 tons of drive.");


done_testing();

