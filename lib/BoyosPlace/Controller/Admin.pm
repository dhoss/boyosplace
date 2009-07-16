package BoyosPlace::Controller::Admin;

use strict;
use warnings;
use parent 'Catalyst::Controller::HTML::FormFu';

=head1 NAME

BoyosPlace::Controller::Admin - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut



sub base : Chained("/") PathPart("admin") CaptureArgs(0) {

    my ( $self, $c, $action ) = @_;

    ## not authorized
    unless ( $c->check_user_roles("admin") ) {
    
        $c->detach("unauthorized");
    
    }
   

}

sub index :Path :Args(0) {
    my ($self, $c) = @_;
    
}

sub approve_photos : Chained('base') PathPart("photos") Args(0) {
    my ($self, $c) = @_;
    
    my @photos = $c->model('DB::Photos')->search({ approved => 0 });
    $c->stash(
        photos   => \@photos,
        template => "admin/list_photos.tt2"
    );
    
    
    if ( $c->req->param ) {
     
         my @ids = $c->req->param('approve_me');
         for ( @ids ) {
             my $image = $c->model('DB::Photos')->find($_);
             $image->approved(1);
             $image->update or die $!;
         }
         
         $c->stash( status_msg => scalar @ids . " images approved" );
         $c->detach;
        
    }

}

sub approve_users : Chained('base') PathPart("users") Args(0){
    my ($self, $c) = @_;
    
    my $user_rs = $c->model('DB::Users');
   
    my @users = $user_rs->search_related('user_roles')->search({ roleid => '2' });

    $c->stash(
        users   => \@users,
        template => "admin/list_users.tt2"
    );
    
    
    if ( $c->req->param ) {
     
         my @ids = $c->req->param('approve_me');
         for ( @ids ) {
             my $user = $c->model('DB::Users')->find($_);
             $user->add_to_user_roles({roleid => 2 });
             $user->update or die $!;
         }
         
         $c->stash( status_msg => scalar @ids . " users approved" );
         $c->detach;
        
    }

}

=head2 unauthorized

something to detach to when logins fail

=cut

sub unauthorized : Global {
    my ( $self, $c ) = @_;
    
    $c->stash( error_msg => "You don't have the proper permissions to access this page" );
    
}
 
=head1 AUTHOR

Devin Austin,,,

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
