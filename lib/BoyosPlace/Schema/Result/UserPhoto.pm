use utf8;
package BoyosPlace::Schema::Result::UserPhoto;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

BoyosPlace::Schema::Result::UserPhoto

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::TimeStamp>

=item * L<DBIx::Class::Helper::Row::ToJSON>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp", "Helper::Row::ToJSON");

=head1 TABLE: C<user_photos>

=cut

__PACKAGE__->table("user_photos");

=head1 ACCESSORS

=head2 user

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 photo

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 created_at

  data_type: 'timestamp with time zone'
  is_nullable: 1

=head2 updated_at

  data_type: 'timestamp with time zone'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "user",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "photo",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "created_at",
  { data_type => "timestamp with time zone", is_nullable => 1 },
  "updated_at",
  { data_type => "timestamp with time zone", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</user>

=item * L</photo>

=back

=cut

__PACKAGE__->set_primary_key("user", "photo");

=head1 RELATIONS

=head2 photo

Type: belongs_to

Related object: L<BoyosPlace::Schema::Result::Photo>

=cut

__PACKAGE__->belongs_to(
  "photo",
  "BoyosPlace::Schema::Result::Photo",
  { id => "photo" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 user

Type: belongs_to

Related object: L<BoyosPlace::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  "user",
  "BoyosPlace::Schema::Result::User",
  { id => "user" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07022 @ 2012-05-29 09:24:09
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ppbtUSCXCLfXjgv/tAgsjg

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
