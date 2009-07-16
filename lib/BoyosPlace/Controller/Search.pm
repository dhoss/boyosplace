package BoyosPlace::Controller::Search;

use strict;
use warnings;
use parent 'Catalyst::Controller::HTML::FormFu';

=head1 NAME

BoyosPlace::Controller::Search - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

simple search function.
currently just searches photos

=cut

sub index :Path FormConfig('search/default.yml') {
    my ( $self, $c ) = @_;

    my $table = $c->req->param('f');
    my $query = $c->req->param('q');
    my $rows  = $c->req->param('n') || 50;
    my $page  = $c->req->param('p') || 1;
    my $form  = $c->stash->{form};
    my $results;
    
    
    $results = $c->model('DB::Photos')->search(
        [
            { caption => { 'like' => '%' . $query . '%' }, },
            { name    => { 'like' => '%' . $query . '%' }, },
        ],
        {
            rows => $rows,
            page => $page,
        }
    );
    
    $c->session->{pager} = $results->pager;
       
    $c->stash(
        results   => $results,
        count     => $results->count,
        template  => 'search/results.tt2',
    );
    
}


=head1 AUTHOR

Devin Austin,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
