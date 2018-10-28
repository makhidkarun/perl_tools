#!/usr/bin/env perl
#
# travel_time.pl
#
use warnings;
use strict;

use Math::Complex;

my $time;

sub seconds_to_travel {
  my $time = 2 * ( sqrt($distance / $m_drive));
  print $time;
}

print("Distance in km:  ");
chomp(my $distance = <STDIN>);

print("M Drive: ");
chomp(my $m_drive = <STDIN>);


&seconds_to_travel;
print "\n";
