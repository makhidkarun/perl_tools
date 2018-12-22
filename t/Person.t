# t/Person.t
#
use strict;
use warnings;
use 5.008_004;

use Test::More;
use lib 'lib';
use Person;

BEGIN {
    use_ok( 'Person' ) || BAIL_OUT();
}

diag( "Testing Person $Person::VERSION, Perl $], $^X" );

done_testing();
