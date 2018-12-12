#!/usr/bin/env perl
#
# roll_dice.pl
#
use strict;
use warnings;
#use 5.008_004;  # Leam's personal limitation.  
use Getopt::Long;

sub roll_dice() {
  my $roll = int(rand(6)) + int(rand(6)) + 2;
  return $roll;
}

my %args;
my $rolls = 1;

GetOptions(
  "rolls=i" => \$rolls,
  );

for (my $i = 0; $i < $rolls; $i++) {
  print roll_dice . " ";
}
print "\n";
