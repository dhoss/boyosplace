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


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2008-11-17 19:57:41
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:I1UD61UWOgAbC2byrlKajA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
