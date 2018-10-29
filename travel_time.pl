#!/usr/bin/env perl
#
# travel_time.pl
#
# WORK IN PROGRESS!!!!
# That is, it doesn't work and I need to make progress...

use warnings;
use strict;

use Math::Complex;

my $time = '';
my $minutes = 0;

print("Distance in km:  ");
chomp(my $distance = <STDIN>);

print("M Drive: ");
chomp(my $m_drive = <STDIN>);


my $seconds = &seconds_to_travel($distance, $m_drive);
&seconds_to_larger;

print "It will take $minutes minutes and $seconds seconds to get there.\n";

sub seconds_to_travel {
  # Humans use Kilometers but the math uses Meters.
  $distance *= 1000;
  int(2 * ( sqrt($distance / $m_drive)));
}

sub seconds_to_larger {
  if ($seconds > 60) {
    $minutes = int($seconds / 60);
    $seconds -= $seconds - ($seconds * $minutes);
  }
}

