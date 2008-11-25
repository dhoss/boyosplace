package BoyosPlace::Schema::Photos;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components(
  "InflateColumn::DateTime",
  "InflateColumn::File",
  "PK::Auto",
  "Core",
);
__PACKAGE__->table("photos");
__PACKAGE__->add_columns(
  "photoid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "uploaded",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 0,
    size => 19,
  },
  "path",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "caption",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => 65535,
  },
);
__PACKAGE__->set_primary_key("photoid");


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2008-11-24 08:30:03
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:doWrFj8q1iP9pUxKSg4VWA


# You can replace this text with custom content, and it will be preserved on regeneration
## this is down here since we *have* to specify this column
## as ::Loader can't do it for us
use BoyosPlace;
__PACKAGE__->add_columns(
	"path",
	{
		data_type        => "varchar",
		is_file_column   => 1,
		file_column_path => BoyosPlace->path_to( 'root', 'static', 'photos' ) . "",
		default_value    => undef,
		is_nullable      => 1,
		size             => 255,
	},
);
1;
