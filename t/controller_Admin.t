use strict;
use warnings;
use Test::More tests => 3;

BEGIN { use_ok 'Catalyst::Test', 'BoyosPlace' }
BEGIN { use_ok 'BoyosPlace::Controller::Admin' }

ok( request('/admin')->is_success, 'Request should succeed' );


