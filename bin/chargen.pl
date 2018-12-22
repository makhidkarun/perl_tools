#!/usr/bin/env perl

# chargen.pl
#

use warnings;
use strict;
use 5.008_004;
use DBI;
use lib 'lib';
use Names qw( gen_name );
use Person qw( new show_s4);
sub upp_to_s {
  my @my_upp = @_;
  my $str = join '', map {sprintf '%X', $_} @my_upp;
  return $str;
}

sub gen_upp {
  my $roll;
  my $counter = 0;
  my @upp;
  while ($counter < 6){
    $roll = int(rand(6)) + int(rand(6)) + 2; 
    push(@upp, $roll);
    $counter++;
  }
  return @upp;
}

####
my @upp             = gen_upp();
my $upp_s           = upp_to_s(@upp);
my %data;
$data{'gender'}     = int(rand(2)) ? "F" : "M";
my $name            = gen_name(%data);

printf("%s [%s] %s\n", 
  $name, 
  $data{'gender'}, 
  $upp_s);

my $fred = Person->new;
$fred->show_s4;

