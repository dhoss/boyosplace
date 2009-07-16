package BoyosPlace::Schema::Result::Roles;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components(
  "InflateColumn::DateTime",
  "PK::Auto",
  "Core",
);
__PACKAGE__->table("roles");
__PACKAGE__->add_columns(
  "role",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "roleid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("roleid");

__PACKAGE__->has_many(
  "user_roles",
  "BoyosPlace::Schema::Result::UserRoles",
  { "foreign.roleid" => "self.roleid" },
);

1;