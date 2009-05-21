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
        email_send_object => Email::Send->new({ mailer => 'Test' }),
        mailer  =>  'Test',
        to      => $options->{email},
        from    => $config->{email}{from},
        subject => "Boyosplace.com Registration Confirmation",
        data    => "Thank you for signing up!",
    );
    
    my $create = sub {
        my $user = $self->resultset('Users')->create(
            {
                name     => $options->{name},
                email    => $options->{email},
                password => $options->{password},
            }
        );
        $user->add_to_user_roles({ roleid => 1 });
        $email->send unless $ENV{NO_EMAIL};
    };
    
    $self->txn_do($create);
    
    if ($@) {
        die "Something went wrong creating a user: $@";
        exit;
    }


}
1;
