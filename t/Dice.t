# t/Dice.t
#
use strict;
use warnings;
use 5.008_004;

use Test::More;
use lib 'lib';
use Dice qw( roll_dice roll_1 roll_2 );

BEGIN {
    use_ok( 'Dice' ) || BAIL_OUT();
}

diag( "Testing Dice $Dice::VERSION, Perl $], $^X" );

# roll_1 tests
my $roll_1_min = 6;
my $roll_1_max = 1;
eval {
  my $roll;
  for (1..1000) {
    $roll = roll_1;
    if ( $roll < $roll_1_min ){
      $roll_1_min = $roll;
    } elsif ( $roll > $roll_1_max ){
      $roll_1_max = $roll;
    }
  }
};
ok( $roll_1_min == 1,  "Roll min is $roll_1_min, lower than 1" );
ok( $roll_1_max == 6,  "Roll max is $roll_1_max, higher than 6" );

# roll_2 tests
my $roll_2_min = 12;
my $roll_2_max = 2;
eval {
  my $roll;
  for (1..1000) {
    $roll = roll_2;
    if ( $roll < $roll_2_min ){
      $roll_2_min = $roll;
    } elsif ( $roll > $roll_2_max ){
      $roll_2_max = $roll;
    }
  }
};
ok( $roll_2_min == 2,   "Roll min is $roll_2_min, lower than 2" );
ok( $roll_2_max == 12,  "Roll max is $roll_2_max, higher than 12" );


done_testing();
