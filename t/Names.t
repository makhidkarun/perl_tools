# t/Names.t
#
use strict;
use warnings;
use 5.008_004;

use Test::More;
use lib 'lib';
use Names qw (gen_name );

BEGIN {
    use_ok( 'Names' ) || BAIL_OUT();
}

diag( "Testing Names $Names::VERSION, Perl $], $^X" );

my %name;
my %name_l;
my %name_data;

%name = gen_name;
%name_data = ( 'last' => 'Flintstone' );
%name_l = gen_name( %name_data );

# General test, does it give a two phrase string?
ok( length($name{'first'}) > 2, "Name{first} is $name{'first'}");
ok( length($name{'last'}) > 2, "Name{last} is $name{'last'}");
ok( $name_l{'last'} eq 'Flintstone', "name_l{'last'} is $name_l{'last'}");
 
done_testing();
