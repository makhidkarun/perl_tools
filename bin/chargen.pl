#!/usr/bin/env perl

# chargen.pl
#

use warnings;
use strict;
use 5.008_004;
use DBI;
use lib 'lib';
use Person;

my $person = Person->new;
$person->show_s4();

