package BoyosPlace::Schema::Roles;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components(
  "InflateColumn::DateTime",
  "InflateColumn::FS",
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


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2008-12-01 02:57:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:AXxEI3cB4YKhtK6J4fUuIA


# You can replace this text with custom content, and it will be preserved on regeneration
__PACKAGE__->has_many(
  "user_roles",
  "BoyosPlace::Schema::UserRoles",
  { "foreign.roleid" => "self.roleid" },
);

1;
