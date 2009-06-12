package BoyosPlace::Email;

use Moose;
use Moose::Util::TypeConstraints;
use Email::Stuff;
use Email::Valid;


subtype 'Email', 
    as 'Str', 
    where { Email::Valid->address($_) eq $_ }; 

coerce 'Email', 
    from 'Str', 
    via { scalar Email::Valid->address($_) };

has 'subject' => ( is => 'rw', isa => "Str" );
has 'to'      => ( is => 'rw', isa => "Email" );
has 'from'    => ( is => 'rw', isa => "Email" );
has 'data'    => ( is => 'rw', isa => "Str" );
#has 'cc'      => ( is => 'rw', isa => "Str" );


has 'email'   => ( is => 'ro', isa => "Email::Stuff", 
                   default => sub {
                       my $self = shift;
                       Email::Stuff->from      ( $self->from    )
                                   ->to        ( $self->to      )
                                  # ->cc        ( $self->cc      )
                                   ->subject   ( $self->subject )
                                   ->text_body ( $self->data    )
                       
                   },
                   lazy =>1,
); 


sub send {
    my $self = shift;

    my $rv = $self->email->send;
    die $rv unless $rv;
    
}


no Moose;

__PACKAGE__->meta->make_immutable;
1;
