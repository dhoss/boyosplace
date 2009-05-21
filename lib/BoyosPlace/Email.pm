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

has 'subject' => ( is => 'ro', isa => "Str" );
has 'to'      => ( is => 'ro', isa => "Email" );
has 'from'    => ( is => 'ro', isa => "Email" );
has 'data'    => ( is => 'ro', isa => "Str" );
has 'cc'      => ( is => 'ro', isa => "Str" );
has 'email'   => ( is => 'ro', isa => "Email::Stuff", 
                   default => sub {
                       my $self = shift;
                       Email::Stuff->new(
                          from          =>$self->from,
                          to            =>$self->to,
                          cc            =>$self->cc,
                          subject       =>$self->subject,
                          text_body     =>$self->data
                       );
                   },
                   lazy =>1,
); 


sub send {
    my $self = shift;
    
    $self->email->send or die $!;
    
}


no Moose;

__PACKAGE__->meta->make_immutable;
1;
