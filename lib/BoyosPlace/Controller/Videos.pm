package BoyosPlace::Controller::Videos;

use strict;
use warnings;
use parent 'Catalyst::Controller';

=head1 NAME

BoyosPlace::Controller::Videos - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    ## just list our videos
    #my @videos = $c->model('YouTube')->list_by_user('coach1234');
    #$c->stash(
    #    videos => \@videos,
    #);
}


=head1 AUTHOR

Devin Austin,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
