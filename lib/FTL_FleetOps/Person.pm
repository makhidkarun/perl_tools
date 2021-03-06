package FTL_FleetOps::Person;

use 5.008;
use strict;
use warnings;
use lib 'lib';
use FTL_FleetOps::Names qw(gen_name);

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
  my $self              = shift;
  my %data              = @_;
  unless ( $data{'gender'} ) {
    $data{'gender'}     = gen_gender();
  }
  my @upp               = gen_upp();
  $data{'upp'}          = \@upp;
  $data{'name'}         = gen_name(%data);
  $data{'skills'}       = ();
  $data{'plot'}         = add_plot();
  $data{'temperament'}  = add_temperament();
  $data{'appearence'}   = add_appearence();
  bless \%data, $self;
}

=head2 add_skill

=cut

sub add_skill {
  my($self, $skill, $level) = @_;
  $self->{'skills'}{$skill} += $level;
}

=head2 add_plot

=cut

sub add_plot {
  my @plot = items_from_file('data/plots.txt', 1);
  return $plot[0];
}

=head2 add_temperament

=cut

sub add_temperament {
  my @temps = items_from_file('data/temperaments.txt', 1, 1);
  return $temps[0];
}

=head2 add_appearence

=cut

sub add_appearence {
  my $hair    = get_hair();
  my $skin    = get_skin();
  my $height  = get_height();
  my $weight  = get_weight();
  my $desc    = ucfirst($height);
  $desc       .= ', ' . $weight . ' build. ';
  $desc       .= ucfirst($hair) . ', ';
  $desc       .= $skin . '.';
  return $desc;
}


=head2 get_height

=cut

sub get_height {
  my @height  = items_from_file('data/height.txt');  
  return $height[0];
}

=head2 get_skin

=cut

sub get_skin {
  my @tone  = items_from_file('data/skin_tones.txt');  
  my $skin  = $tone[0] . ' skin';
  return $skin;
}

=head2 get_weight

=cut

sub get_weight {
  my @weight  = items_from_file('data/weight.txt');  
  return $weight[0];
}

=head2 get_hair

=cut

sub get_hair {
  my @length  = items_from_file('data/hair_length.txt');  
  my @body    = items_from_file('data/hair_body.txt');  
  my @color   = items_from_file('data/hair_colors.txt');  
  my $hair    = ucfirst($length[0]) . ' ';
  $hair       .= $body[0] . ' ';
  $hair       .= $color[0] . ' hair';
  return $hair;
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

=head2 items_from_file

=cut

sub items_from_file {
  use Fcntl 'O_RDONLY';
  use Tie::File;
  
  my ($file, 
    $count, 
    $unique) = @_; 
  $count     ||= 1;
  $unique    = 0 unless (defined($unique));
  my @answer;
  my @used;
  my $selection;

  tie(my @data, 'Tie::File', $file, mode => O_RDONLY) 
    or die "Can't open $file:  $!\n";

  for (my $i = 0; $i < $count; ) { 
    $selection = $data[int(rand(scalar(@data)))];
    next unless $selection;
    next if $selection =~ /^#/;
    next if ($unique and grep $_ eq $selection, @answer);
    push(@answer, $selection);
    $i++;
  }
  return @answer;
}

=head2 show_skills

=cut

sub show_skills {
  my $self = shift;
  my $str;
  my %skills  = %{$self->{'skills'}};
  foreach my $key (keys(%skills)) {
    if ($str) {
      $str .= ", ";
    }
    my $value = $skills{$key};
    $str .= "$key-$value";
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

=head2 show

=cut

sub show {
  my $self = shift;
  printf("%s [%s] %s \n", 
    $self->{'name'}, 
    $self->{'gender'}, 
    upp_s($self->{'upp'}),
    );
  printf("Appearence: %s \n", $self->{'appearence'}); 
  if ($self->{'skills'}){
    my $skill_string = $self->show_skills();
    printf("%s \n", $skill_string);
  }
  printf("Temperament: %s\n", $self->{'temperament'});
  printf("Plot: %s \n", $self->{'plot'}); 
};

=head2 show_s4

=cut

sub show_s4 {
  my $self = shift;
  printf("%s [%s] %s \n", 
    $self->{'name'}, 
    $self->{'gender'}, 
    upp_s($self->{'upp'}),
    );
  if ($self->{'skills'}){
    my $skill_string = $self->show_skills();
    printf("%s \n", $skill_string);
  }
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
