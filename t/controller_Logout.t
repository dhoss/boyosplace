use strict;
use warnings;
use Test::More tests => 3;

BEGIN { use_ok 'Catalyst::Test', 'BoyosPlace' }
BEGIN { use_ok 'BoyosPlace::Controller::Logout' }

ok( request('/logout')->is_success, 'Request should succeed' );


