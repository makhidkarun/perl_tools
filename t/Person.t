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
 
# Test skill array tools.
#my %skill_list      = ( GunCbt => 1, Liaison => 2 );
#$data{'_skills'}    = %skill_list;
my $test_skills     = Person->new();
$test_skills->add_skill('GunCbt', 1);
my $skill_string    = $test_skills->show_skills;
ok( ref($skill_string) eq 'STRING', "$skill_string not a string" );
 
done_testing();
