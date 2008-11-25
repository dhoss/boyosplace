package BoyosPlace::Controller::Photos;

use strict;
use warnings;
use parent 'Catalyst::Controller::HTML::FormFu';
use HTTP::Date;
use DateTime;
use Imager;
use File::Basename;
use IO::File;

__PACKAGE__->mk_accessors(qw(thumbnail_size));

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

	my @photos = $c->model('DB::Photos')->all;

	$c->stash->{photos}   = \@photos;
	$c->stash->{template} = "photos/index.tt2";

}

=head2 get_photos

  set up photo stash
  
=cut

sub get_photos : Chained('/') PathPart('photo') CaptureArgs(1) {
	my ( $self, $c, $photoid ) = @_;

	my $photo = $c->model('DB::Photos')->find($photoid);

	if ( $photo == undef ) {

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

     
	unless ( $c->check_user_roles('admin') ) {

		$c->flash->{error_msg} = "You don't have the proper permissions to add photos here";
		$c->res->redirect( $c->uri_for('/photos') );

	}

	if ( $form->submitted_and_valid ) {

		my $photo = $c->model('DB::Photos')->create(
			{
				name => $form->param('photo_name'),
				path => {
					handle   => $c->req->upload('photo')->fh,
					filename => $c->req->upload('photo')->basename
				},
				caption  => $form->param('caption'),
				uploaded => DateTime->now,
			}
		);

		$c->stash->{status_msg} = "Successfully uploaded!";
		$c->stash->{photo} = $photo;
		$c->detach;

	}

}

=head2 generate_thumbnail

  this method generates a thumbnail of a 
  given image

=cut

sub generate_thumbnail : Chained('get_photos') PathPart('thumbnail') Args(0) {
	my ( $self, $c ) = @_;
    
    use BoyosPlace;
	## adapted from CGI::Application::PhotoGallery
	my $photo = $c->stash->{photo};
	use Data::Dumper;
	$c->log->debug(Dumper($photo->path));
	my $img_path =BoyosPlace->path_to("static","photos", $photo->photoid, $photo->path->filename) . "";
	$c->log->debug("image path:" . $img_path);
	my $size    = $self->thumbnail_size;
	my $cache   = $c->cache;
	my $key     = $photo->photoid . $photo->path;
	my $lastmod = ( stat($img_path) )[9];

	## here we're setting up cacheing
	## if there's a key that matches $data
	## in the cache, we split up the date
	## and shove it into $reqmod
	
	my $fh = IO::File->new($img_path , 'r');
	
    $c->log->debug("MiME type:" . (fileparse($photo->path->filename))[2] );
	$c->res->content_type( (fileparse($photo->path->filename))[2] );
	$c->res->header( 'Last-Modified' =>HTTP::Date::time2str($lastmod) );
	binmode $fh;
	$c->res->body($fh);

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
