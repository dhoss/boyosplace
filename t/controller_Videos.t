use strict;
use warnings;
use Test::More tests => 3;

BEGIN { use_ok 'Catalyst::Test', 'Videos' }
BEGIN { use_ok 'BoyosPlace::Controller::Videos' }

ok( request('/videos')->is_success, 'Request should succeed' );


