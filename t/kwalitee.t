#!/usr/bin/env perl
#
# kwalitee.t
use strict;
use warnings;

eval { require Test::Kwalitee };
exit if $@;
Test::Kwalitee->import();

