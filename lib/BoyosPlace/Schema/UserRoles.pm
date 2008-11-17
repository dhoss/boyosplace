package BoyosPlace::Schema::UserRoles;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
__PACKAGE__->table("user_roles");
__PACKAGE__->add_columns(
  "userid",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
  "roleid",
  { data_type => "INT", default_value => 0, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("userid", "roleid");
__PACKAGE__->belongs_to("roleid", "BoyosPlace::Schema::Roles", { roleid => "roleid" });
__PACKAGE__->belongs_to("userid", "BoyosPlace::Schema::Users", { userid => "userid" });


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2008-11-17 11:42:45
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:appIu8ZglZqIYfSadAi6Aw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
