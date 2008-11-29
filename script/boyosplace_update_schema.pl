#!/usr/bin/perl 

## this works fine for development
## but should probably add some production environment vars too
use FindBin;
use DBIx::Class::Schema::Loader qw| make_schema_at |;
make_schema_at(
	"BoyosPlace::Schema",
	{
		debug          => 1,
		use_namespaces => 0,
		components     => [qw/ InflateColumn::DateTime InflateColumn::FS PK::Auto/],
		dump_directory => "$FindBin::Bin/../lib"
	},
	[ "dbi:mysql:boyosplace", "root", "lairdo" ]
);
