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

my %data;
$data{'gender'} = int(rand(2)) ? "F" : "M";
my $name           = gen_name( %data );

$data{'last'}   = 'Flintstone' ;
my $name_l         = gen_name( %data );

# General test, does it give a two phrase string?
ok( length($name) > 5, "Name too short: $name");
ok( ( split / /, $name) ==  2, "Name isn't two words: $name");
ok( $name_l =~ /Flintstone/, "Name doesn't match: $name_l");
 
done_testing();
