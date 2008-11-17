package BoyosPlace::Controller::Photos;

use strict;
use warnings;
use parent 'Catalyst::Controller::HTML::FormFu';
use IO::File;

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

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->stash->{template} = "photos/index.tt2";
      
}

=head2 get_photos

  set up photo stash
  
=cut
 
 sub get_photos : Chained('/') PathParth('photo') Args(1) {
 	my ($self, $c, $photoid) = @_;
 	
 	my $photo = $c->model('DB::Photos')->find($photoid);
 	
 	if ( $photo == undef ) {
 		
 		$c->stash->{error_msg} = "No such photo.";
 		 		
 	} else {
 		
 		$c->stash->{photo} = $photo;
 		
 	}
 	
 }
 
=head2 add_photo

  Add a photo to the database

=cut

sub add_photo : Path('/photo/add') FormConfig('photos/add.yml') {
	my ( $self, $c ) = @_;
	
	my $form = $c->stash->{form};
	if ( $form->submitted_and_valid ) {
		
		
		
	}
	
	
}

=head1 AUTHOR

Devin,,,

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
