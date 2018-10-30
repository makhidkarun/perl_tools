#!/usr/bin/env perl
#
# travel_time.pl
#
# Usage:  ./travel_time.pl 100000 2
#         It will take 1h14m to get there.
#
# TODO: 
# 1. Set up for command line options.
# 2. Write tests.

use warnings;
use strict;
use Math::Complex;

die "Usage: travel_time.pl <distance (km)> <acceleration (M-Drive)>\n" unless @ARGV == 2;

my ($distance, $m_drive) = @ARGV;

my @time;
my $minute    = 60;
my $hour      = $minute * 60;
my $day       = $hour * 24; 

my $seconds   = seconds_to_travel($distance, $m_drive);
seconds_to_larger();

# Only use the two most significant time periods.
my $t_string  = $time[0] . $time[1];

print "It will take $t_string to get there.\n";

sub seconds_to_travel {
  # Humans use Kilometers but the math uses Meters.
  my ($distance, $m_time) = @_;
  $distance         *= 1000;
  # M Drive   * 10 is Acceleration in meters per second.
  my $acceleration  = $m_drive * 10;
  int(2 * ( sqrt($distance / $acceleration)));
}

sub seconds_to_larger {
  my $days;
  my $hours;
  my $minutes;
  if ($seconds > $day) {
    $days         = int($seconds / $day);
    $seconds      = $seconds - ($day * $days);
    my $d_string  = $days . "d";
    push(@time, $d_string);
  }
  if ($seconds > $hour) {
    $hours        = int($seconds / $hour);  
    $seconds      = $seconds - ($hour * $hours);
    my $h_string  = $hours . "h";
    push(@time, $h_string);
  }
  if ($seconds > $minute) {
    $minutes      = int($seconds / $minute);
    $seconds      = $seconds % $minute;
    my $m_string  = $minutes . "m";
    my $s_string  = $seconds . "s";
    push(@time, $m_string, $s_string);
  }
}

