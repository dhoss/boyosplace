package BoyosPlace::Schema::Result::Users;

use strict;
use warnings;

use base 'DBIx::Class';


use BoyosPlace;


__PACKAGE__->load_components(
  "InflateColumn::DateTime",
  "PK::Auto",
  "Core",
);
__PACKAGE__->table("users");
__PACKAGE__->add_columns(
  "confirmed",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "confirm_key",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "about",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => 65535,
  },
  "created",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 0,
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
    is_nullable => 1,
  },
  "name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
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
    is_nullable => 1,
    size => 255,
  },
  "userid",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("userid");
__PACKAGE__->sequence('user_id_sequence');


=head2 user roles
 
roles for users. 
such as "Admin," "Moderator," etc.

=cut

__PACKAGE__->has_many(
  "user_roles",
  "BoyosPlace::Schema::Result::UserRoles",
  { "foreign.userid" => "self.userid" },
);

__PACKAGE__->many_to_many( 'roles' => 'user_roles', 'roleid' );


1;
