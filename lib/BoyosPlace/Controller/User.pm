package BoyosPlace::Controller::User;

use Moose;
use namespace::autoclean;
BEGIN { extends 'Catalyst::Controller::REST' }

sub base : Chained('/') PathPart('user') CaptureArgs(0) {
  my ( $self, $c ) = @_;
}

sub load_user : Chained('base') PathPart('') CaptureArgs(1) {
  my ( $self, $c, $username ) = @_;

  my $user = $c->model('Database::User')->find({ username => $username });

  $c->stash( user => $user );
}

sub read : Chained('load_user') PathPart('') Args(0) ActionClass('REST') {}

sub read_GET {
  my ( $self, $c ) = @_;

  my $user = $c->stash->{'user'};
  return $self->status_bad_request($c,
    message => "No such user"
  ) if !$user;

  return $self->status_ok($c,
    entity => {
      user => $user
    }
  );
}

sub browse : Chained('/') PathPart('users') CaptureArgs(0){}

sub browse_GET {
  my ( $self, $c ) = @_;

  return $self->status_ok($c,
    entity => {
      users => $c->model('Database::User')->all
    }
  );
}

__PACKAGE__->meta->make_immutable;

1;
