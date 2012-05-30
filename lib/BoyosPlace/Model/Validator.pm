package BoyosPlace::Model::Validator;

use Moose;
use namespace::autoclean;
use BoyosPlace::Validator;
with 'Catalyst::Component::InstancePerContext';

sub build_per_context_instance {
  my ( $self, $c ) = @_;
  return BoyosPlace::Validator->new;
}

__PACKAGE__->meta->make_immutable;
1;
