#!/usr/bin/env perl

# chargen.pl
#

use warnings;
use strict;
use 5.008_004;
use DBI;
use lib 'lib';
use FTL_FleetOps::Person;

my $person = FTL_FleetOps::Person->new;
$person->show_s4();

