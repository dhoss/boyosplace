package BoyosPlace::View::TT;

use strict;
use base 'Catalyst::View::TT';

__PACKAGE__->config(
	TEMPLATE_EXTENSION => '.tt2',
	INCLUDE_PATH =>
	  [ BoyosPlace->path_to( 'root' ) ],
	CATALYST_VAR       => 'c',
	TIMER              => 0,

	# Not set by default
	WRAPPER => 'wrapper'
);

=head1 NAME

BoyosPlace::View::TT - TT View for BoyosPlace

=head1 DESCRIPTION

TT View for BoyosPlace. 

=head1 AUTHOR

=head1 SEE ALSO

L<BoyosPlace>

Devin Austin
devin.austin@gmail.com
http://www.codedright.net
http://www.onthebeachatnight.com

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
