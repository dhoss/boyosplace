package BoyosPlace::Schema::UserRoles;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components(
  "InflateColumn::DateTime",
  "InflateColumn::File",
  "PK::Auto",
  "Core",
);
__PACKAGE__->table("user_roles");
__PACKAGE__->add_columns(
  "userid",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "roleid",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("userid", "roleid");


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2008-11-18 18:46:34
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:A1gd9Q2j4v+w3IqahLrDPw


__PACKAGE__->belongs_to("roleid", "BoyosPlace::Schema::Roles", { roleid => "roleid" });
__PACKAGE__->belongs_to("userid", "BoyosPlace::Schema::Users", { userid => "userid" });

1;
