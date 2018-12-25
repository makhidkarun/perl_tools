#!perl -T
use 5.008;
use strict;
use warnings;
use Test::More;
use lib 'lib';

plan tests => 1;

BEGIN {
    use_ok( 'Crew' ) || print "Bail out!\n";
}

diag( "Testing Crew $Crew::VERSION, Perl $], $^X" );

done_testing();

