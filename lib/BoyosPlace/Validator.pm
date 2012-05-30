package BoyosPlace::Validator;

use Moose;
use namespace::autoclean;
use Data::Manager;
use Data::Verifier;
use MooseX::Types::Email qw/EmailAddress EmailMessage/;

has 'dm' => (
  is => 'ro',
  lazy => 1,
  required => 1,
  default => sub {
    return Data::Manager->new
  }
);

has 'user_verifier' => (
  is => 'ro',
  lazy => 1,
  required => 1,
  default => sub {
    Data::Verifier->new(
      profile => {
        name => {
          required => 1,
          type => 'Str',
        },
        password => {
          required => 1,
          type => 'Str',
          min_length => 6
          dependent => {
            password_confirm => {
              required => 1,
              type => 'Str',
              min_length => 6
            },
          post_check => sub {
            my $r = shift;
            return $r->get_value('password') eq $r->get_value('password_confirm');
          }
        },
        email => {
          type => EmailAddress,
        },
        location => {
           type => 'Str'
        }
      }
);
1;
