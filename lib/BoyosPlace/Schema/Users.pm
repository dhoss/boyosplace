package BoyosPlace::Schema::Users;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
__PACKAGE__->table("users");
__PACKAGE__->add_columns(
  "confirmed",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "confirm_key",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "about",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 0,
    size => 65535,
  },
  "created",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 0,
    size => 19,
  },
  "email",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "last_here",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 0,
    size => 19,
  },
  "name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "password",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "profile_image",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "userid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("userid");
__PACKAGE__->has_many(
  "user_roles",
  "BoyosPlace::Schema::UserRoles",
  { "foreign.userid" => "self.userid" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2008-11-17 11:42:45
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:UMrio7iVhuAKkII75SgQxQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
