use utf8;
package BoyosPlace::Schema::Result::Thumbnail;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

BoyosPlace::Schema::Result::Thumbnail

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

=head1 TABLE: C<thumbnails>

=cut

__PACKAGE__->table("thumbnails");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'thumbnails_id_seq'

=head2 photo

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 path

  data_type: 'text'
  is_nullable: 1

=head2 height

  data_type: 'integer'
  is_nullable: 1

=head2 width

  data_type: 'integer'
  is_nullable: 1

=head2 size

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
    sequence          => "thumbnails_id_seq",
  },
  "photo",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "path",
  { data_type => "text", is_nullable => 1 },
  "height",
  { data_type => "integer", is_nullable => 1 },
  "width",
  { data_type => "integer", is_nullable => 1 },
  "size",
  { data_type => "integer", is_nullable => 1 },
  "created_at",
  { data_type => "timestamp with time zone", is_nullable => 1 },
  "updated_at",
  { data_type => "timestamp with time zone", is_nullable => 1 },
);

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


# Created by DBIx::Class::Schema::Loader v0.07022 @ 2012-05-29 09:24:09
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:oa3IvYnNDnt3qFQtcz82UQ
# These lines were loaded from 'lib/BoyosPlace/Schema/Result/Thumbnail.pm' found in @INC.
# They are now part of the custom portion of this file
# for you to hand-edit.  If you do not either delete
# this section or remove that file from @INC, this section
# will be repeated redundantly when you re-create this
# file again via Loader!  See skip_load_external to disable
# this feature.

use utf8;
package BoyosPlace::Schema::Result::Thumbnail;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

BoyosPlace::Schema::Result::Thumbnail

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

=head1 TABLE: C<thumbnails>

=cut

__PACKAGE__->table("thumbnails");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'thumbnails_id_seq'

=head2 photo

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 path

  data_type: 'text'
  is_nullable: 1

=head2 height

  data_type: 'integer'
  is_nullable: 1

=head2 width

  data_type: 'integer'
  is_nullable: 1

=head2 size

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
    sequence          => "thumbnails_id_seq",
  },
  "photo",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "path",
  { data_type => "text", is_nullable => 1 },
  "height",
  { data_type => "integer", is_nullable => 1 },
  "width",
  { data_type => "integer", is_nullable => 1 },
  "size",
  { data_type => "integer", is_nullable => 1 },
  "created_at",
  { data_type => "timestamp with time zone", is_nullable => 1 },
  "updated_at",
  { data_type => "timestamp with time zone", is_nullable => 1 },
);

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


# Created by DBIx::Class::Schema::Loader v0.07022 @ 2012-05-22 10:42:30
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:s/skDP7iIkANzlE5Y3qeRA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
# End of lines loaded from 'lib/BoyosPlace/Schema/Result/Thumbnail.pm' 


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
