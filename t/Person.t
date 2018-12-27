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

my %data;

$data{'last'} = 'Lefron';
my $test_last_name = Person->new(%data);
my %tln_h = $test_last_name->person_hash;
ok( $tln_h{'name'} =~ /Lefron/, "Failed Last Name.");
 

done_testing();
