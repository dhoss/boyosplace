package BoyosPlace::Schema;

use strict;
use warnings;

use BoyosPlace;
use BoyosPlace::Email;
use base 'DBIx::Class::Schema';

__PACKAGE__->load_classes;

sub create_user {
    my ($self, $options) = @_;
    
    $options ||= {};
    my $config = BoyosPlace->config;
    my $email = BoyosPlace::Email->new(
        to      => $options->{email},
        from    => $config->{email}{from},
        subject => "Boyosplace.com Registration Confirmation",
        data    => "Thank you for signing up!",
    );
    
    my $create = sub {
        $self->name( $options->{name} );
        $self->email( $options->{email} );
        $self->password( $options->{password} );
        $email->send;
    };
    
    $self->txn_do($create);
    
    if ($@) {
        die "Something went wrong creating a user: $@";
        exit
    }


}
1;
