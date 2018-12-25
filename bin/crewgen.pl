#!/usr/bin/env perl
#
# crewgen.pl
#
use strict;
use warnings;
use lib 'lib';
use Ship;

my ($name, $hull_size) = ("Miss Rosa", 400);
my @ship_data = split /:/, "Miss Rosa:400:2:3:200:4:50:Trip_Beam, Trip_Pulse, Trip_Pulse, Trip_Miss";
print "@ship_data\n";

#my $ship = Ship->new($name, $hull_size);
my $ship = Ship->new(\@ship_data);
my $s_name = $ship->name();
my $s_hull_size = $ship->hull_size();
my $s_weapons = $ship->weapons();
print "$s_name, a $s_hull_size armed merchant, has $s_weapons.\n";


