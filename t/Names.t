# t/Names.t
#
use strict;
use warnings;
use 5.008_004;

use Test::More;
use lib 'lib';
use Names;

BEGIN {
    use_ok( 'Names' ) || BAIL_OUT();
}

diag( "Testing Names $Names::VERSION, Perl $], $^X" );

done_testing();
