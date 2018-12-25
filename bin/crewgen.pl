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
my $required_engineers  = $ship->required_engineers();
my $required_gunners    = $ship->required_gunners();

my %crew;
$crew{'pilot'} = Person->new();
$crew{'navigator'} = Person->new();
print "$s_name\n";
print '=' x length($s_name) . "\n";
printf("\n\t %-15s", "Pilot");
$crew{'pilot'}->show_s4();
printf("\n\t %-15s", "Navigator");
$crew{'navigator'}->show_s4();
for my $x (1..$required_engineers) {
  my $eng_number = "eng_" . $x;
  $crew{$eng_number} = Person->new();
  printf("\n\t %-15s", "Engineer");
  $crew{$eng_number}->show_s4();
}
for my $x (1..$required_gunners) {
  my $gunner_number = "gunn_" . $x;
  $crew{$gunner_number} = Person->new();
  printf("\n\t %-15s", "Gunner");
  $crew{$gunner_number}->show_s4();
}
print "\n";





