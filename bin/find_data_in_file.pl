#!/usr/bin/env perl
#
use strict;
use warnings;
use Getopt::Std;
use 5.008_004;

my %args;
getopts("d:p:", \%args);
my $start_dir = $args{d};
my $pattern   = $args{p};

my @dirs = ();
my %seen;

if (! $start_dir) {
  $start_dir = `pwd`;
  chomp($start_dir);
} elsif (! -d $start_dir) {
  die "$start_dir is not a directory!";
}
push @dirs, $start_dir;

while (my $pwd = shift @dirs) {
  opendir(DIR, "$pwd") or die "Cannot open $pwd.\n";
  my @files = readdir(DIR);
  closedir(DIR);
  foreach my $file (@files) {
    next if $file =~ /^\.\.?$/;
    my $path = "$pwd/$file";
    if (-d $path) {
      next if $seen{$path};
      $seen{$path} = 1;
      push @dirs, $path;
    } 
    if (-T $path) {
      open MY_F, "$path";
      while (defined (my $line = <MY_F>)) {
        if ( $line =~ /$pattern/ ) {
          chomp $line;
          print("$path : $line\n");
        }
      }
    }
  }
}
