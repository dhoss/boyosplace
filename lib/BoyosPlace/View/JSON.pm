package BoyosPlace::View::JSON;

use strict;
use base 'Catalyst::View::JSON';

use JSON::XS ();
use Try::Tiny;
use Data::Dumper;

sub encode_json {
    my($self, $c, $data) = @_;
    my $encoder = JSON::XS->new->ascii->allow_nonref->convert_blessed->allow_blessed;
    $encoder->pretty if $c->debug;
    my $d = $encoder->encode($data);
    return $d;
}

sub process {
    my ( $self, $c, $stash_key ) = @_;

    my $output;
    try {
      $output = $self->serialize( $c, $c->stash->{$stash_key} );
      $c->response->body( $output );
       return 1;
     } catch {
       $c->log->error("Couldn't serialize: $_");
       return $_;
     };
}

sub serialize {
    my ( $self, $c, $data ) = @_;

    my $serialized = $self->encode_json($c, $data);

    $c->log->debug("JSON: " . Dumper $serialized);
    return $serialized;
}


=head1 NAME

BoyosPlace::View::JSON - Catalyst JSON View

=head1 SYNOPSIS

See L<BoyosPlace>

=head1 DESCRIPTION

Catalyst JSON View.

=head1 AUTHOR

,,,

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut



1;
