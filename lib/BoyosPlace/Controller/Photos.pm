package BoyosPlace::Controller::Photos;

use namespace::autoclean;
use Moose;
BEGIN { extends 'Catalyst::Controller::HTML::FormFu'; }

has 'thumbnail_size' => (
    is => 'ro',
    isa => 'Int',
    reader => 'thumbnail_size',
    required => 1,
    #default => 80,
);

has 'default_view_size' => (
    is => 'ro',
    isa => 'Int',
    reader => 'default_view_size',
    required => 1,
);

use HTTP::Date;
use DateTime;
use Imager;
use MIME::Types;
use File::MimeInfo ();
use BoyosPlace;


=head1 NAME

BoyosPlace::Controller::Photos - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut

=head2 index

  display the puppy photos
  paginate

=cut

sub index : Path : Args(0) {
	my ( $self, $c ) = @_;

	my @photos = $c->model('DB::Photos')->search({ approved => 1 });

	$c->stash->{photos}   = \@photos;
	$c->stash->{template} = "photos/index.tt2";

}

=head2 get_photos

  set up photo stash

=cut

sub get_photos : Chained('/') PathPart('photo') CaptureArgs(1) {
	my ( $self, $c, $photoid ) = @_;

	my $photo = $c->model('DB::Photos')->find({ photoid => $photoid, approved =>1 });

	if ( !$photo ) {

		$c->stash->{error_msg} = "No such photo.";

	}
	else {
        
		$c->stash->{photo} = $photo;

	}

}

=head2 add_photo

  Add a photo to the database

=cut

sub add_photo : Path('/photo/add') FormConfig('photos/add.yml') {
	my ( $self, $c ) = @_;

	$c->stash->{template} = "photos/add.tt2";
	my $form = $c->stash->{form};
	my $mime = MIME::Types->new;

	if ( $form->submitted_and_valid ) {

		my $photo = $c->model('DB::Photos')->create(
			{
				name     => $form->param('photo_name'),
				path     => $c->req->upload('photo')->fh,
				caption  => $form->param('caption'),
				uploaded => DateTime->now,
				mime => $mime->mimeTypeOf( $c->req->upload('photo')->basename ),
			}
		);

		$c->stash->{status_msg} = "Successfully uploaded!";
		$c->stash->{photo}      = $photo;
		$c->detach;

	}

}

=head2 generate_thumbnail

  this method generates a thumbnail of a
  given image

=cut

sub generate_thumbnail : Chained('get_photos') PathPart('thumbnail') Args(0) {
	my ( $self, $c ) = @_;

	## adapted from CGI::Application::PhotoGallery

	my $photo = $c->stash->{photo};
	my $size  = $self->thumbnail_size;

	my $mimeinfo = File::MimeInfo->new;

	my $data = $photo->path->open('r') or die "Error: $!";

	my $out;
    unless ( $out = $c->cache->get($photo->photoid) ) {

        my $img = Imager->new;
	    $img->read( fh => $data ) or die $img->errstr;
	    my $scaled = $img->scale( xpixels => $size );

	    $scaled->write(
	        type => $mimeinfo->extensions( $photo->mime ),
		    data => \$out
	    ) or die $scaled->errstr;

        $c->cache->set($photo->photoid, $out);
    }

	$c->res->content_type( $photo->mime );
	$c->res->content_length( -s $out );


	binmode STDOUT;
	$c->res->body($out);

}

=head2 view_image

  hackish method to view
  an image full-size

=cut

sub view_image : Chained('get_photos') PathPart('generate') Args(0) {
	my ( $self, $c ) = @_;

	## adapted from CGI::Application::PhotoGallery

	my $photo = $c->stash->{photo};

	my $mimeinfo = File::MimeInfo->new;

	my $data = $photo->path->open('r') or die "Error: $!";
	my $out;
    unless ( $out = $c->cache->get($photo->uploaded . $photo->photoid) ) {

        my $img = Imager->new;
	    $img->read( fh => $data ) or die $img->errstr;
        my $scaled = $img->scale( xpixels => $self->default_view_size );
	    $scaled->write(
		    type => $mimeinfo->extensions( $photo->mime ),
		    data => \$out
	    ) or die $scaled->errstr;
	    $c->cache->set($photo->uploaded . $photo->photoid, $out);
    }

	$c->res->content_type( $photo->mime );
	$c->res->content_length( -s $out );


	binmode STDOUT;
	$c->res->body($out);

}

=head2 view_photo

  view an individual photo

=cut

sub view_photo : Chained("get_photos") PathPart('view') Args(0) {
	my ( $self, $c ) = @_;

	my $photo = $c->stash->{photo};

	$c->stash->{template} = "photos/view.tt2";

}

=head2 delete_photo

  delete a photo or photos

=cut

sub delete_photo : Chained("get_photos") PathPart('delete') Args(0) {
	my ( $self, $c ) = @_;

	my $photo = $c->stash->{photo};
	$c->stash->{template} = 'photos/delete.tt2';

	if ( $c->check_user_roles("admin") ) {

		if ( $c->req->param('delete') eq 'yes' ) {

			$photo->delete;
			$c->stash->{status_msg} = "Photo " . $photo->photoid . " deleted!";
			$c->detach;

		}

	}
	else {

		$c->flash->{error_msg} =
		  "You don't have proper permissions to delete images.";
		$c->res->redirect("/");

	}

}

=head1 AUTHOR

Devin Austin
devin.austin@gmail.com
http://www.codedright.net

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
