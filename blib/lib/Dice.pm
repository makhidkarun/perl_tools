package Dice;

use 5.008;
use strict;
use warnings;
use Exporter;
our @ISA = 'Exporter';
our @EXPORT_OK = qw( roll_dice roll_1 roll_2);

=head1 NAME

Dice - Random roller for 2d6 based Role-Playing Games.

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Provides dice rolls for other code. 

  use Dice qw( roll_dice roll_1 roll_2);
  
  # Shortcut standard roll: 
  my $roll = roll_2;

  # If using more than 2 dice, and have a per-total modifier.
  my $other_roll = roll_dice(5,+3);

=head1 EXPORT

  roll_dice
  roll_1
  roll_2

=head1 SUBROUTINES/METHODS

=head2 roll_dice

=cut

sub roll_dice {
  my ($number, $modifier) = @_;
  $modifier ||= 0;
  my $total;
  for (1..$number) { 
    $total += int(rand(6)) + 1;
  }
  return $total + $modifier;
}

=head2 roll_1

=cut

sub roll_1 {
  return roll_dice(1,0);
}

=head2 roll_2

=cut

sub roll_2 {
  return roll_dice(2,0);
}

=head1 AUTHOR

Leam Hall, C<< <leamhall at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-. at rt.cpan.org>, or through
the web interface at L<https://rt.cpan.org/NoAuth/ReportBug.html?Queue=.>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Dice


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<https://rt.cpan.org/NoAuth/Bugs.html?Dist=.>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/.>

=item * CPAN Ratings

L<https://cpanratings.perl.org/d/.>

=item * Search CPAN

L<https://metacpan.org/release/.>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2018 Leam Hall.

This program is distributed under the MIT (X11) License:
L<http://www.opensource.org/licenses/mit-license.php>

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.


=cut

1; # End of Dice
