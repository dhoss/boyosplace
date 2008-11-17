#!/usr/bin/perl
use FindBin;
use lib "$FindBin::Bin/../lib";
use BoyosPlace::Schema;
my $schema = BoyosPlace::Schema->connect("dbi:mysql:boyosplace", "root", "lairdo");
$schema->deploy( { add_drop_tables => 1 } );
