#!/usr/bin/perl
use Config::General;
use FindBin;
use lib "$FindBin::Bin/../lib";
use BoyosPlace::Schema;
my $conf = Config::General->new($ARGV[0]);
my %hash = $conf->getall;
my $schema = BoyosPlace::Schema->connect($hash{Model::DB}{connect_info}[0], $hash{Model::DB}{connect_info}[1], $hash{Model::DB}{connect_info}[2]);
$schema->deploy( { add_drop_tables => 1 } );
