#!/usr/bin/env perl
#
# crewgen.pl
#
# Usage:
#   bin/crewgen.pl --config=data/ships.csv --name=Rosa
#

use strict;
use warnings;
use lib 'lib';
use Getopt::Long;

use Crew qw( crew_show );
use FTL_FleetOps::Ship;
use Person;

my $config;
my $name;
my %ship_data;

GetOptions(
  "config=s"    => \$config,
  "name=s"      => \$name,
);

open my $CONFIG, '<', "$config" or die $!;
while (<$CONFIG>) {
  next if ( $_ =~ m/\#/);
  chomp;
  if ( $_ =~ /$name/ ) {
    my @ship_data = split /:/, $_;
    $ship_data{_name}      = $ship_data[0];
    $ship_data{_hull_size} = $ship_data[1];
    $ship_data{_jump}      = $ship_data[2];
    $ship_data{_maneuver}  = $ship_data[3];
    $ship_data{_max_cargo} = $ship_data[4];
    $ship_data{_max_pass}  = $ship_data[5];
    $ship_data{_drive_ton} = $ship_data[6];
    $ship_data{_weapons}   = $ship_data[7];
  }
}

my $ship          = FTL_FleetOps::Ship->new(\%ship_data);
my $s_name        = $ship->name();
my $s_hull_size   = $ship->hull_size();
my $s_max_cargo   = $ship->max_cargo();
my $s_weapons     = $ship->weapons();

my %crew;
print "$s_name\n";
print '=' x length($s_name) . "\n";

print("\nFlight Crew\n===========\n");
crew_show(\%crew, 'pilot', 1);
print "\n";
crew_show(\%crew, 'navigator', 1);

print("\nEngineering\n============\n");
my $min_engineers  = $ship->min_engineers();
for my $x (1..$min_engineers) {
  crew_show(\%crew, 'eng', $x);
  print "\n";
}


if ( $ship->need_medic() ) {
  print("\nMedical\n=======\n");
  crew_show(\%crew, 'medic', 1);
  print "\n";
}

my $min_gunners    = $ship->min_gunners();
if ( $min_gunners ) {
  print("\nGunnery\n=======\n");
  for my $x (1..$min_gunners) {
    crew_show(\%crew, 'gunner', $x);
    print "\n";
  }
  print "\n";
}

my $min_stewards  = $ship->min_stewards();
if ( $min_stewards ) {
  print("\nStewards\n========\n");
  for my $x (1..$min_stewards) {
    crew_show(\%crew, 'steward', $x);
  }
  print "\n";
}
  
print "\n";
