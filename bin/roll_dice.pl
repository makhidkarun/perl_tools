#!/usr/bin/env perl
#
# roll_dice.pl
#
use strict;
use warnings;
use 5.008_004;  # Leam's personal limitation.  
use Getopt::Long;
use lib 'lib';
use FTL_FleetOps::Dice qw( roll_dice roll_1 roll_2);

my %args;
my $rolls = 1;

GetOptions(
  "rolls=i" => \$rolls,
  );

my $dice = FTL_FleetOps::Dice->new();
for (1..$rolls) {
  print $dice->roll_2() . " ";
}
print "\n";
