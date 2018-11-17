#!/usr/bin/env perl
#
# skills.pl
# Test area for dealing with a skills hash.
#

use strict;
use warnings;

sub skills_tos {
  my %s = @_;
  join(', ', map "${_}-$s{$_}", sort keys %s);
}

sub skills_fe {
  my %s2 = @_;
  foreach my $key (sort keys %s2) {
    print "$key : $s2{$key}\n";
  }
}

my %skills = ("CbtR" => 2, "ZeroG" => 1, "VaccSuit" => 2);
my $skill_string = skills_tos(%skills);
print("$skill_string\n");
#skills_fe(%skills);
