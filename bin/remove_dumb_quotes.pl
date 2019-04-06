#!/usr/bin/env perl

use strict;
use warnings;
use utf8;

# cp1252   https://en.wikipedia.org/wiki/Windows-1252A

my @files;
my $dir = 'scenes';
my $new_dir = 'new_scenes';

opendir(my $dh, $dir) or die "Can't opendir $dir: $!";
while (readdir $dh) {
    push @files, $_;
}
closedir $dh;

for my $file (@files) {
    if ( index($file, '.') ) {
        my $filename = $dir . '/' . $file;
        my $new_filename = $new_dir . '/' . $file;
        print "$filename\n";
        open my $f , '<', $filename or die "Cannot open $filename: $!\n";
        open my $new_f , '>:encoding(UTF-8)', $new_filename or die "Cannot open $new_filename: $!\n";
        while( my $line = <$f> )  {
            utf8::decode($line);
            $line =~ s/\x{2018}/'/g;
            $line =~ s/\x{2019}/'/g;
            $line =~ s/\x{201C}/"/g;
            $line =~ s/\x{201D}/"/g;
            $line =~ s/C-LT/Cadet Lieutenant/g;
            print $new_f $line;
        }
        close($f);
        close($new_f);
    }
}

