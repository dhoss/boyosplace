package BoyosPlace::Controller::About;

use strict;
use warnings;
use parent 'Catalyst::Controller';

=head1 NAME

BoyosPlace::Controller::About - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index 

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched BoyosPlace::Controller::About in About.');
}


=head1 AUTHOR

Devin Austin,,,

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
