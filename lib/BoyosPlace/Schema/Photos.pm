package BoyosPlace::Schema::Photos;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components(
  "InflateColumn::DateTime",
  "InflateColumn::FS",
  "PK::Auto",
  "Core",
);
__PACKAGE__->table("photos");
__PACKAGE__->add_columns(
  "photoid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "approved",
  { data_type => "TINYINT", default_value => 0, is_nullable => 0, size => 1 },
  
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
  },
  "path",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "caption",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => 65535,
  },
  "mime",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },

);
__PACKAGE__->set_primary_key("photoid");


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2008-12-01 02:57:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:A/YrsvGDAWKpDaGlJ3Dwqg


# You can replace this text with custom content, and it will be preserved on regeneration
## this is down here since we *have* to specify this column
## as ::Loader can't do it for us
use BoyosPlace;
__PACKAGE__->add_columns(
	"path",
	{
	    data_type      => 'TEXT',
        is_fs_column   => 1,
        fs_column_path =>BoyosPlace->path_to( 'root', 'static', 'photos' ) . ""
	}
);
1;
