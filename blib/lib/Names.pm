package Names;

use 5.008;
use strict;
use warnings;
use DBI;

=head1 NAME

Names

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Generates a name, based off an optional gender and/or last name requirement.

Perhaps a little code snippet.

    use Names;

    my $foo = Names->new();
    ...


=head1 SUBROUTINES/METHODS

=head2 function1

=cut

sub gen_name {
  my $driver    = "SQLite";
  my $database  = "data/names.db";
  my $dsn       = "DBI:$driver:dbname=$database";
  my $userid    = "";
  my $password  = "";
  my $dbh       = DBI->connect($dsn, $userid, $password, { RaiseError => 1 }) o
r die $DBI::errstr;
  my $stmt_last     = qq(SELECT * from humaniti_last ORDER BY RANDOM() LIMIT 1;
);
  my $stmt_first = '';

  my %name;
  $name{'gender'} = int(rand(2)) ? "F" : "M";

  if ($name{'gender'} eq 'M' ) {
    $stmt_first  = qq(SELECT * from humaniti_male_first ORDER BY RANDOM() LIMIT
 1;);
  } else {
    $stmt_first  = qq(SELECT * from humaniti_female_first ORDER BY RANDOM() LIM
IT 1;);
  }

  my $sth_f     = $dbh->prepare( $stmt_first );
  my $rv_f      = $sth_f->execute() or die $DBI::errstr;
  my $sth_l     = $dbh->prepare( $stmt_last );
  my $rv_l      = $sth_l->execute() or die $DBI::errstr;

  if($rv_l < 0) {
    print $DBI::errstr;
  }

  while(my @row_f = $sth_f->fetchrow_array()) {
  $name{'first'} = $row_f[0];
  }

  while(my @row_l = $sth_l->fetchrow_array()) {
  $name{'last'} = $row_l[0];
  }
  
  $dbh->disconnect();
  return %name; 
}

=head2 function2

=cut

sub function2 {
}

=head1 AUTHOR

Leam Hall, C<< <leamhall at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-. at rt.cpan.org>, or through
the web interface at L<https://rt.cpan.org/NoAuth/ReportBug.html?Queue=.>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Names


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

1; # End of Names
