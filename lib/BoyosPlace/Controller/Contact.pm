package BoyosPlace::Controller::Contact;

use strict;
use warnings;
use parent 'Catalyst::Controller::HTML::FormFu';
use Email::Stuff;

=head1 NAME

BoyosPlace::Controller::Contact - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index 

=cut

sub index :Path :Args(0) FormConfig('contact/index.yml'){
    my ( $self, $c ) = @_;

    my $form = $c->stash->{form};
    $c->stash->{template} = "contact/index.tt2";
    
    if ( $form->submitted_and_valid ) {

        Email::Stuff->from ( BoyosPlace->config->{email}{from})
              ->to         ( $form->param('email')       ) 
              ->subject    ( "Comments from: " . $form->param('user') )
              ->text_body  ( $c->view('TT')->render($c, 'contact/body.tt2' , 
                             { 
                               comments => $form->param('comments'),
                               name     => $form->param('user') 
                             })
              )
              ->send;
    	
    	$c->stash->{status_msg} = "Thanks for your comments!";
    	$c->detach;
    	
    } 
}


=head1 AUTHOR

Devin Austin
devin.austin@gmail.com
http://www.onthebeachatnight.com
http://www.codedright.net

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
