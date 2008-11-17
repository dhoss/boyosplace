package BoyosPlace::Schema::Roles;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
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


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2008-11-17 02:17:37
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:OjrI1JzB/GMvj5bFJbHGvg


__PACKAGE__->has_many(
  "user_roles",
  "BoyosPlace::Schema::UserRoles",
  { "foreign.roleid" => "self.roleid" },
);
1;
