# t/Dice.t
#
use strict;
use warnings;
use 5.008_004;

use Test::More;
use lib 'lib';
use FTL_FleetOps::Dice;

BEGIN {
    use_ok( 'FTL_FleetOps::Dice' ) || BAIL_OUT();
}

diag( "Testing Dice $FTL_FleetOps::Dice::VERSION, Perl $], $^X" );

my $dice  = FTL_FleetOps::Dice->new();
# roll_1 tests
my $roll_1_min = 6;
my $roll_1_max = 1;
eval {
  my $roll;
  for (1..1000) {
    $roll = $dice->roll_1();
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
    $roll = $dice->roll_2();
    if ( $roll < $roll_2_min ){
      $roll_2_min = $roll;
    } elsif ( $roll > $roll_2_max ){
      $roll_2_max = $roll;
    }
  }
};
ok( $roll_2_min == 2,   "Roll min is $roll_2_min, lower than 2" );
ok( $roll_2_max == 12,  "Roll max is $roll_2_max, higher than 12" );

# roll with modifier tests
my $roll_min_plus_three = 15;
my $roll_max_plus_three = 5;
eval {
  my $roll;
  for (1..1000) {
    $roll = $dice->roll_dice( 2, 3);
    if ( $roll < $roll_min_plus_three ){
      $roll_min_plus_three = $roll;
    } elsif ( $roll > $roll_max_plus_three ){
      $roll_max_plus_three = $roll;
    }
  }
};
ok( $roll_min_plus_three == 5,   "Roll plus 3 min is $roll_min_plus_three, lower than 5" );
ok( $roll_max_plus_three == 15,  "Roll plus 3 max is $roll_max_plus_three, higher than 15" );


=head
# roll multiple dice with modifier tests
my $multi_roll_min_plus_three = 33;
my $multi_roll_max_plus_three = 8;
eval {
  my $roll;
  for (1..1000) {
    $roll = $dice->roll_dice( 5, +3);
    if ( $roll < $multi_roll_min_plus_three ){
      $multi_roll_min_plus_three = $roll;
    } elsif ( $roll > $multi_roll_max_plus_three ){
      $multi_roll_max_plus_three = $roll;
    }
  }
};
ok( $multi_roll_min_plus_three == 8,   "Roll min is $multi_roll_min_plus_three, lower than 8" );
ok( $multi_roll_max_plus_three == 33,  "Roll max is $multi_roll_max_plus_three, higher than 33" );

=cut

done_testing();
