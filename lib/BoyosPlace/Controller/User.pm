package BoyosPlace::Controller::User;

use Moose;
use namespace::autoclean;
BEGIN { extends 'Catalyst::Controller::REST' }
use Try::Tiny;

__PACKAGE__->config(
  map => {
    'text/html'        => [ 'View', 'HTML' ],
    'application/json' => [ 'View', 'JSON' ]
  }
);

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

sub browse : Chained('/') PathPart('users') Args(0){}

sub browse_GET {
  my ( $self, $c ) = @_;

  return $self->status_ok($c,
    entity => {
      users => [$c->model('Database::User')->all]
    }
  );
}

sub create : Chained('base') PathPart('new') Args(0) ActionClass('REST') {
  my ( $self, $c ) = @_;
  $c->stash( template => 'user/create.tt' );
}

sub create_GET {
  my ( $self, $c ) = @_;
  return $self->status_ok($c,
    entity => {}
  );
}

sub create_POST {
  my ( $self, $c ) = @_;

  my $params = $c->req->data || $c->req->params;
  my $user;
  try {
    $user = $c->model('Database::User')->create({
      name
}
__PACKAGE__->meta->make_immutable;

1;
