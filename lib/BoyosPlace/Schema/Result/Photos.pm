package BoyosPlace::Schema::Result::Photos;

use strict;
use warnings;

use base 'DBIx::Class';
use BoyosPlace;

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
  "path",
  {
    data_type      => 'TEXT',
    is_fs_column   => 1,
    fs_column_path =>BoyosPlace->path_to( 'root', 'static', 'photos' ) . ""
  }

);
__PACKAGE__->set_primary_key("photoid");


1;
