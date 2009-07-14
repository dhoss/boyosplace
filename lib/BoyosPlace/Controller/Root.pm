package BoyosPlace::Controller::Root;

use strict;
use warnings;
use parent 'Catalyst::Controller';
use Regexp::Common;

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config->{namespace} = '';

=head1 NAME

BoyosPlace::Controller::Root - Root Controller for BoyosPlace

=head1 DESCRIPTION

boyosplace.com

=head1 METHODS

=cut

=head2 index

=cut

sub index :Path {
    my ( $self, $c, $page ) = @_;
    
    
    my $photos = $c->model('DB::Photos')->search(
        {
            approved => 1
        },
        {
            page => $page || 1,
            rows => 10
        }
    );
    #my @photos = $photos->all;
    $c->stash( 
        photos => [$photos->all],
        pager  => $photos->pager,
    );

}

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
    
}


=head2 end

Attempt to render a view, if needed.

=cut 

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

Devin Austin,,,

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
