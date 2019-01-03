#!/usr/bin/env perl
#
# module_dependencies.pl
#
# Usage:
#   module_dependencies.pl --dir <start_dir>
#
# Logs to module.deps
#
use strict;
use warnings;
use Getopt::Long;

my $start_dir;
GetOptions(
  "dir=s" => \$start_dir,
);

my @dirs = ($start_dir);
my $dir;
my %modules;
my @seen;
my $module;

while (my $pwd = shift @dirs) {
  opendir( $dir, $pwd ) or die "Cannot open $pwd: $!.\n";
  my @files = readdir($dir);
  foreach my $file (@files) {
    next if $file =~ /^\.\.?$/;
    my $path = "$pwd/$file";
    if ( -d $path ){
      push (@dirs, $path) unless ( grep( /^$path$/, @dirs));
    }
    if ( -T $path ){
      open my $file, "$path"; 
      my @use_list;
      while (defined ( my $line = <$file>)){
        if ( $line =~ /^package(.*);$/ ){
          $module = $1;
        } elsif ( $line =~ /^use\s(.*)(\s|;)/ ){
          my $uses_line = $1;
          next if $uses_line =~ /strict|warnings|5\.[012]/;
          $uses_line    =~ s/^\s+//;
          $uses_line    =~ s/;//;
          my @uses_array  = split / /, $uses_line;
          my $uses        = $uses_array[0];
          push( @use_list, $uses );
        }
        @{$modules{$module}} = @use_list;
      }
      close($file);
    }
  }
  closedir($dir);
}

open my $out_file, '>', 'module.deps' or die $!;
select $out_file;
my @module_list = sort( keys(%modules));
foreach my $k (@module_list){
  print "Module: $k\n";
  foreach my $v (@{$modules{$k}}){
    print "  Uses:  $v\n";
  }
}
close($out_file);
