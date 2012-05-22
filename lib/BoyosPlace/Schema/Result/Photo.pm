use utf8;
package BoyosPlace::Schema::Result::Photo;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

BoyosPlace::Schema::Result::Photo

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<photos>

=cut

__PACKAGE__->table("photos");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'photos_id_seq'

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 description

  data_type: 'text'
  is_nullable: 1

=head2 path

  data_type: 'text'
  is_nullable: 1

=head2 size

  data_type: 'integer'
  is_nullable: 1

=head2 thumbnail

  data_type: 'integer'
  is_nullable: 1

=head2 height

  data_type: 'integer'
  is_nullable: 1

=head2 width

  data_type: 'integer'
  is_nullable: 1

=head2 created_at

  data_type: 'timestamp with time zone'
  is_nullable: 1

=head2 updated_at

  data_type: 'timestamp with time zone'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "photos_id_seq",
  },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "description",
  { data_type => "text", is_nullable => 1 },
  "path",
  { data_type => "text", is_nullable => 1 },
  "size",
  { data_type => "integer", is_nullable => 1 },
  "thumbnail",
  { data_type => "integer", is_nullable => 1 },
  "height",
  { data_type => "integer", is_nullable => 1 },
  "width",
  { data_type => "integer", is_nullable => 1 },
  "created_at",
  { data_type => "timestamp with time zone", is_nullable => 1 },
  "updated_at",
  { data_type => "timestamp with time zone", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 thumbnails

Type: has_many

Related object: L<BoyosPlace::Schema::Result::Thumbnail>

=cut

__PACKAGE__->has_many(
  "thumbnails",
  "BoyosPlace::Schema::Result::Thumbnail",
  { "foreign.photo" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 user_photos

Type: has_many

Related object: L<BoyosPlace::Schema::Result::UserPhoto>

=cut

__PACKAGE__->has_many(
  "user_photos",
  "BoyosPlace::Schema::Result::UserPhoto",
  { "foreign.photo" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07022 @ 2012-05-22 10:42:30
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6vABPBABX54dl47sfElS1w


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
