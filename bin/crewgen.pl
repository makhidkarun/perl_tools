#!/usr/bin/env perl
#
# crewgen.pl
#
use strict;
use warnings;
use lib 'lib';
use Ship;

my ($name, $hull_size) = ("Miss Rosa", 400);

my $ship = Ship->new($name, $hull_size);
print "$ship->name() \n";


