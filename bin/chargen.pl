#!/usr/bin/env perl

# chargen.pl
#

use warnings;
use strict;
use 5.008_004;
use DBI;

sub upp_to_s {
  my @my_upp = @_;
  my $str = join '', map {sprintf '%X', $_} @my_upp;
  return $str;
}

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

sub gen_name {
  my $driver    = "SQLite";
  my $database  = "data/names.db";
  my $dsn       = "DBI:$driver:dbname=$database";
  my $userid    = "";
  my $password  = "";
  my $dbh       = DBI->connect($dsn, $userid, $password, { RaiseError => 1 }) or die $DBI::errstr;
  my $stmt_last     = qq(SELECT * from humaniti_last ORDER BY RANDOM() LIMIT 1;);
  my $stmt_first = '';

  my %name;
  $name{'gender'} = int(rand(2)) ? "F" : "M";

  if ($name{'gender'} eq 'M' ) {
    $stmt_first  = qq(SELECT * from humaniti_male_first ORDER BY RANDOM() LIMIT 1;);
  } else {
    $stmt_first  = qq(SELECT * from humaniti_female_first ORDER BY RANDOM() LIMIT 1;);
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

####

my @upp   = gen_upp();
my $upp_s = upp_to_s(@upp);
my %name  = gen_name();

printf("%s %s [%s] %s\n", $name{'first'}, $name{'last'}, $name{'gender'}, $upp_s);

