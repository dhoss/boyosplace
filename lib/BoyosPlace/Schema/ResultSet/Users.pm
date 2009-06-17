package BoyosPlace::Schema::ResultSet::Users;

use strict;
use warnings;

use parent 'DBIx::Class::ResultSet';


use BoyosPlace;
use BoyosPlace::Email;
use Text::Password::Pronounceable;


=head2 yoinked

The following methods have been stolen from rafl :-)

=cut

=head2 activate

activate a user

=cut

sub activate {
	my ($self) = @_;

	$self->result_source->schema->txn_do(
		sub {
			$self->update( { confirmed => 1, confirm_key => undef } );
		}
	);
}

=head2 hash_password

hash a user's password using
the SHA1 algorithm.

=cut

sub hash_password {
	my ($self, $password) = @_;

	my $d = Digest->new('SHA-1');
	$d->add( $password );
	$d->hexdigest;

}

=head2 update

overload update to hash password

=cut

sub update {
    my ($self, $col_data) = @_;
    $col_data ||= {};

    if ($col_data->{password}) {
    	## we have to update the password key
    	## delete it, so that the new one passed
    	## can be hashed
        $self->password( delete $col_data->{password} );
        $self->hash_password;
    }

    return $self->next::method($col_data);
}

=head2 reset_password

reset a user's password
by generating a random password
with Text::Password::Pronounceable
also, update their confirmed status to 0
so the user has to manually confirm the password

=cut

sub reset_password {
	my ($self) = @_;

	my $pass = Text::Password::Pronounceable->new( 6, 10 )->generate;
	$self->update(
		{
			#confirmed => 0,
			password  => $pass,
		}
	);

	return $pass;
}

=head2 belongs_to_user

checks to see if a given profile belongs to a user
returns a 1 if it belongs to the user 
returns a 0 if it does not belong to the user

=cut

sub belongs_to_user {
	my ( $self, $accessor ) = @_;

	return $self->result_source->resultset->search(
		{ userid => $self->userid, email => $accessor } )->count;

}

sub create_user {
    my ($self, $options) = @_;
    
    $options ||= {};
    
    die "User email exists!"
	  if $self->result_source->resultset->find( { email => $options->{email} } );
	  
    my $config = BoyosPlace->config;
    my $email = BoyosPlace::Email->new(
        to      => $options->{email},
        from    => $config->{email}{from},
        subject => "Boyosplace.com Registration Confirmation",
        data    => "Thank you for signing up!",
    );
    my $key = Digest->new('SHA-1');
	$key->add( $options->{email} );
	
    my $create = sub {
        my $user = $self->create(
            {
                name        => $options->{name},
                email       => $options->{email},
                password    => $self->hash_password( $options->{password} ),
                confirm_key => $key->hexdigest,
                created     => DateTime->now, 
                last_here   => DateTime->now,
            }
        );
        $user->add_to_user_roles({ roleid => 1 });
        my $rv = $email->send;
        die $rv unless $rv;
        
        return $user;
    };
   
    
    my $row = $self->result_source->schema->txn_do($create);
    
    if ($@) {
        die "Something went wrong creating a user: $@";
        exit;
    }

    return $row;

}

1;
