# t/Person.t
#
use strict;
use warnings;
use 5.008_004;

use Test::More;
use lib 'lib';
use FTL_FleetOps::Person;

BEGIN {
    use_ok( 'FTL_FleetOps::Person' ) || BAIL_OUT();
}

diag( "Testing Person $FTL_FleetOps::Person::VERSION, Perl $], $^X" );

my %data;

$data{'last'} = 'Lefron';
my $test_last_name = FTL_FleetOps::Person->new(%data);
my %tln_h = $test_last_name->person_hash;
ok( $tln_h{'name'} =~ /Lefron/, "Failed Last Name.");
 
# Test skill array tools.
my $test_skills     = FTL_FleetOps::Person->new();
$test_skills->add_skill('GunCbt', 1);
my $skill_string    = $test_skills->show_skills;
ok( $skill_string eq 'GunCbt-1', "$skill_string not GunCbt-1 " );
 
done_testing();
