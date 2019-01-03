package Person;

use 5.008;
use strict;
use warnings;
use lib 'lib';
use Names qw(gen_name);

=head1 NAME

Person - The great new Person!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Person;

    my $foo = Person->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 SUBROUTINES/METHODS

=head2 new

=cut

sub new {
  my $self          = shift;
  my %data          = @_;
  unless ( $data{'gender'} ) {
    $data{'gender'} = gen_gender();
  }
  my @upp           = gen_upp();
  $data{'upp'}      = \@upp;
  $data{'name'}     = gen_name(%data);
  $data{'skills'}   = ();
  bless \%data, $self;
}

=head2 add_skill

=cut

sub add_skill {
  my($self, $skill, $level) = @_;
  $self->{'skills'}{$skill} += $level;
 }


=head2 gen_gender

=cut

sub gen_gender {
  my $gender = int(rand(2)) ? "F" : "M";
  return $gender;
}

=head2 gen_upp

=cut

sub gen_upp {
  my $roll;
  my $counter = 0;
  my @upp;
  while ($counter < 6){
    $roll = int(rand(6)) + int(rand(6)) + 2; 
    push(@upp, $roll);
    $counter++;
  }
  return @upp;
}

=head2 show_skills

=cut

sub show_skills {
  my $self = shift;
  my $str;
  foreach my $key (keys($self->{'skills'})) {
    if ($str) {
      $str .= ", ";
    }
    $str .= "$key-$self->{'skills'}{$key}";
  }
  return $str;
}

  
=head2 upp_s

=cut

sub upp_s {
  my @upp = @{$_[0]};
  my $str = join '', map {sprintf '%X', $_} @upp;
  return $str;
}

=head2 show_s4

=cut

sub show_s4 {
  my $self = shift;
  printf("%s [%s] %s", 
    $self->{'name'}, 
    $self->{'gender'}, 
    upp_s($self->{'upp'}));
};

=head2 person_hash

=cut

sub person_hash {
  my $self    = shift;
  my %p       = (
    'name'    => $self->{'name'},
    'gender'  => $self->{'gender'},
    'upp_s'   => upp_s($self->{'upp'}),
  );
  return %p;
}

=head1 AUTHOR

Leam Hall, C<< <leamhall at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-. at rt.cpan.org>, or through
the web interface at L<https://rt.cpan.org/NoAuth/ReportBug.html?Queue=.>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Person


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

1; # End of Person
