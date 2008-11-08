use strict;
use warnings;
use Test::More tests => 3;

BEGIN { use_ok 'Catalyst::Test', 'BoyosPlace' }
BEGIN { use_ok 'BoyosPlace::Controller::Contact' }

ok( request('/contact')->is_success, 'Request should succeed' );


