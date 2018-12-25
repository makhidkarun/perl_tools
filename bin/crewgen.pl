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
use Ship;
use Person;

my $config;
my $name;
my @ship_data;

GetOptions(
  "config=s"    => \$config,
  "name=s"      => \$name,
);

open my $CONFIG, '<', "$config" or die $!;
while (<$CONFIG>) {
  next if ( $_ =~ m/\#/);
  chomp;
  if ( $_ =~ /$name/ ) {
    @ship_data = split /:/, $_;
  }
}

my $ship          = Ship->new(\@ship_data);
my $s_name        = $ship->name();
my $s_hull_size   = $ship->hull_size();
my $s_max_cargo   = $ship->max_cargo();
my $s_weapons     = $ship->weapons();

my %crew;
print "$s_name\n";
print '=' x length($s_name) . "\n";

crew_show(\%crew, 'pilot', 1, 'Pilot');

crew_show(\%crew, 'navigator', 1, 'Navigator');

my $min_engineers  = $ship->min_engineers();
for my $x (1..$min_engineers) {
  crew_show(\%crew, 'eng', $x, 'Engineer');
}

if ( $ship->need_medic() ) {
  crew_show(\%crew, 'medic', 1, 'Medic');
}

my $min_gunners    = $ship->min_gunners();
if ( $min_gunners ) {
  for my $x (1..$min_gunners) {
    crew_show(\%crew, 'gunner', $x, 'Gunner');
  }
}

my $min_stewards  = $ship->min_stewards();
if ( $min_stewards ) {
  for my $x (1..$min_stewards) {
    crew_show(\%crew, 'steward', $x, 'Steward');
  }
}
  
print "\n";
