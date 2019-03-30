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

use FTL_FleetOps::Crew qw( crew_show );
use FTL_FleetOps::Ship;
use FTL_FleetOps::Person;

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
  if ( !defined($name) || $_ =~ /$name/ ) {
    my @line = split /:/, $_;
    $ship_data{name}      = $line[0];
    $ship_data{hull_size} = $line[1];
    $ship_data{jump}      = $line[2];
    $ship_data{maneuver}  = $line[3];
    $ship_data{max_cargo} = $line[4];
    $ship_data{max_pass}  = $line[5];
    $ship_data{drive_ton} = $line[6];
    $ship_data{weapons}   = $line[7];
  }
}

my $ship          = FTL_FleetOps::Ship->new(\%ship_data);
my %crew;

print $ship->name, "\n";
print '=' x length($ship->name) . "\n";

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


if ( $ship->min_medic() ) {
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
