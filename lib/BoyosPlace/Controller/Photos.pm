package BoyosPlace::Controller::Photos;

use strict;
use warnings;
use parent 'Catalyst::Controller::HTML::FormFu';
use IO::File;
use DateTime;

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

    $c->stash->{photos} = [ $c->model('DB::Photos')->all ];
	$c->stash->{template} = "photos/index.tt2";

}

=head2 get_photos

  set up photo stash
  
=cut

sub get_photos : Chained('/') PathParth('photo') Args(1) {
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
	
	unless ( $c->user_exists ) {
		
		$c->flash->{error_msg} = "You must be logged in to add photos";
		$c->res->redirect( $c->uri_for('/photos') );
		
	}
	
	if ( $form->submitted_and_valid ) {
		#eval {

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
			
			

	#	};

	#	if ($@) {

#			$c->stash->{error_msg} = @_;
#			$c->detach;
#
#		}

		$c->stash->{entry}      = $photo;
		$c->stash->{status_msg} = "Successfully uploaded!";
		$c->detach;

	}

}

=head1 AUTHOR

Devin,,,

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
