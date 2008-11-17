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


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2008-11-17 02:17:37
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:o6+8k+P+IIGmn1CpT40Nnw


__PACKAGE__->belongs_to('user' => 'BoyosPlace::Schema::Users', 'userid');
__PACKAGE__->belongs_to('role' => 'BoyosPlace::Schema::Roles', 'roleid');
1;
