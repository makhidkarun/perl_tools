#!/usr/bin/env perl
#
# crewgen.pl
#
use strict;
use warnings;
use lib 'lib';
use Ship;

my @ship_data = split /:/, "Miss Rosa:400:2:3:200:4:50:Trip_Beam, Trip_Pulse, Trip_Pulse, Trip_Miss";

my $ship          = Ship->new(\@ship_data);
my $s_name        = $ship->name();
my $s_hull_size   = $ship->hull_size();
my $s_max_cargo   = $ship->max_cargo();
my $s_weapons     = $ship->weapons();
my $required_engineers = $ship->required_engineers();
print "$s_name, a $s_hull_size dT armed merchant, has $s_max_cargo dT of cargo space available.\n";
print "$s_name requires at least $required_engineers engineers aboard.\n";


