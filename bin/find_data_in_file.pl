#!/usr/bin/env perl
#
# find_data_in_file.pl
#
# Usage:
#   find_data_in_file.pl -d "my_dir" -p "some pattern" [-e "comma,sep,list"]
#    or --dir
#       --pattern
#       --excludes

use strict;
use warnings;
use Getopt::Long;
use 5.008_004;
use Cwd;

my %args;
my $my_dir;
my $dir;
my $pattern;
my $exclude_list;
my @excludes;
my $my_f;

my @dirs = ();
my %seen;

GetOptions(
  "dir=s"           => \$dir,
  "pattern=s"       => \$pattern,
  "exclude_list=s"  => \$exclude_list,
);

if ( $exclude_list) {
  @excludes = split /,/, $exclude_list;
}

if (! $dir) {
  $dir = cwd;
} elsif (! -d $dir) {
  die "$dir is not a directory: $!";
}
push @dirs, $dir;

while (my $pwd = shift @dirs) {
  opendir($my_dir, "$pwd") or die "Cannot open $pwd: $!.\n";
  my @files = readdir($my_dir);
  closedir($my_dir);
  foreach my $file (@files) {
    next if $file =~ /^\.\.?$/;
    my $path = "$pwd/$file";
    if (-d $path) {
      next if $seen{$path};
      $seen{$path} = 1;
      push @dirs, $path;
    } 
    if (-T $path) {
      open $my_f, "$path";
      while (defined (my $line = <$my_f>)) {
        if ( $line =~ /$pattern/ ) {
          my $print_it = 1;
          chomp $line;
          if (@excludes) {
            foreach my $my_ex (@excludes) {
              if ( index( $line, $my_ex ) > -1) {
                $print_it = 0
              }
            }
          }
          print("$path : $line\n") if ( $print_it ); 
        }
      }
      close $my_f;
    }
  }
}
