#!/usr/bin/env perl

# chargen.pl
#

use warnings;
use strict;
use 5.008_004;
use DBI;
use lib 'lib';
use Person;

my $fred = Person->new;
$fred->show_s4;

#my %family_data = {'last' => 'Domici'};
#my $mrs = Person->new( \%family_data );
#$mrs->show_s4;
