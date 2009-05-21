#!/usr/bin/perl

use strict;
use warnings;

use Config::General;
use FindBin;
use lib "$FindBin::Bin/../lib";
use BoyosPlace::Schema;

usage() unless $ARGV[0];

my $conf = Config::General->new($ARGV[0]);
my %hash = $conf->getall;

my $schema = BoyosPlace::Schema->connect(
    $hash{"Model::DB"}{connect_info}[0], 
    $hash{"Model::DB"}{connect_info}[1], 
    $hash{"Model::DB"}{connect_info}[2]
);
$schema->deploy( { add_drop_tables => 1 } );


sub usage {

   print "usage: perl script/boyosplace_deploy_schema.pl boyosplace.conf\n";
   exit;

}
