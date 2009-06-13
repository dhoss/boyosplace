package BoyosPlace::Schema::Users;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components(
  "InflateColumn::DateTime",
  "InflateColumn::FS",
  "PK::Auto",
  "Core",
);
__PACKAGE__->table("users");
__PACKAGE__->resultset_class('BoyosPlace::Schema::ResultSet::Users');

1;
