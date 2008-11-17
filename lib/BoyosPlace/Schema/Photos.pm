package BoyosPlace::Schema::Photos;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
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


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2008-11-17 11:42:45
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:vPebxygA+z3wCE1z/ymQ9g


# You can replace this text with custom content, and it will be preserved on regeneration
1;
