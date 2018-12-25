#!/usr/bin/env perl
#
# crewgen.pl
#
use strict;
use warnings;
use lib 'lib';
use Ship;
use Person;
my @ship_data = split /:/, "Miss Rosa:400:2:3:200:4:50:Trip_Beam, Trip_Pulse, Trip_Pulse, Trip_Miss";
 
my $ship          = Ship->new(\@ship_data);
my $s_name        = $ship->name();
my $s_hull_size   = $ship->hull_size();
my $s_max_cargo   = $ship->max_cargo();
my $s_weapons     = $ship->weapons();

my %crew;
print "$s_name\n";
print '=' x length($s_name) . "\n";

$crew{'pilot'} = Person->new();
printf("\n %-15s", "Pilot");
$crew{'pilot'}->show_s4();

$crew{'navigator'} = Person->new();
printf("\n %-15s", "Navigator");
$crew{'navigator'}->show_s4();

my $min_engineers  = $ship->min_engineers();
for my $x (1..$min_engineers) {
  my $eng_number = "eng_" . $x;
  $crew{$eng_number} = Person->new();
  printf("\n %-15s", "Engineer");
  $crew{$eng_number}->show_s4();
}

if ( $ship->need_medic() ) {
  $crew{'medic'}  = Person->new();
  printf("\n %-15s", "Medic");
  $crew{'medic'}->show_s4();
}

my $min_gunners    = $ship->min_gunners();
if ( $min_gunners ) {
  for my $x (1..$min_gunners) {
    my $gunner_number = "gunn_" . $x;
    $crew{$gunner_number} = Person->new();
    printf("\n %-15s", "Gunner");
    $crew{$gunner_number}->show_s4();
  }
}

my $min_stewards  = $ship->min_stewards();
if ( $min_stewards ) {
  for my $x (1..$min_stewards) {
    my $steward_number = "stew_" . $x;
    $crew{$steward_number}  = Person->new();
    printf("\n %-15s", "Steward");
    $crew{$steward_number}->show_s4();
  }
}
  
print "\n";
