# Dice.pm
#
package Dice;

use strict;
use warnings;
use Exporter;
our @ISA = 'Exporter';
our @EXPORT_OK = qw( roll_dice roll_1 roll_2);

sub roll_dice {
  my ($number, $modifier) = @_;
  $modifier ||= 0;
  my $total;
  for (1..$number) { 
    $total += int(rand(6)) + 1;
  }
  return $total + $modifier;
}

sub roll_2 {
  return roll_dice(2,0);
}

sub roll_1 {
  return roll_dice(1,0);
}
1;
