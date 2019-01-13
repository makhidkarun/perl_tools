package FTL_FleetOps::Ship;

use 5.008;
use strict;
use warnings;

use Moose;
use namespace::autoclean;

has 'name'       => ( is => 'rw');
has 'hull_size'  => ( is => 'rw');
has 'jump'       => ( is => 'rw');
has 'maneuver'   => ( is => 'rw');
has 'max_cargo'  => ( is => 'rw');
has 'max_pass'   => ( is => 'rw');
has 'drive_ton'  => ( is => 'rw');
has 'weapons'    => ( is => 'rw');
  
no Moose;

__PACKAGE__->meta->make_immutable;

=head1 NAME

Ship - The great new Ship!

=head1 VERSION

Version 0.02

=cut

our $VERSION = '0.02';


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use FTL_FleetOps::Ship;

    my $foo = Ship->new();
    ...

=head1 SUBROUTINES/METHODS

=head2 min_engineers

=cut

sub min_engineers {
  my $self          = shift;
  my $engineers     = 0;
  my $drive_tonnage = $self->drive_ton();
  for (; $drive_tonnage > 0; $drive_tonnage -= 35){
    $engineers++;  
  }
  return $engineers;
}

=head2 min_stewards

=cut

sub min_stewards {
  my $self      = shift;
  my $stewards  = 0;
  if ( $self->max_pass() > 0 ) {
    my $pass      = $self->max_pass();
    for (; $pass > 0; $pass -= 8) {
      $stewards++;
    }
    return $stewards;
  }    
}
 
=head2 min_gunners

=cut

sub min_gunners {
  my $self          = shift;
  my $gunners       = 0;
  my @weapons       = split /,/, $self->weapons();
  my $lwc           = scalar @weapons;
  return $lwc;
}

=head2 min_medic

=cut

sub min_medic {
  my $self          = shift;
  my $medic = $self->hull_size >= 200 ? 1 : 0;
  return $medic;
}

=head1 AUTHOR

Leam Hall, C<< <leamhall at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-. at rt.cpan.org>, or through
the web interface at L<https://rt.cpan.org/NoAuth/ReportBug.html?Queue=.>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Ship


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

1; # End of Ship
