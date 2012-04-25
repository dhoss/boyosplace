use strict;
use warnings;

use BoyosPlace;

my $app = BoyosPlace->apply_default_middlewares(BoyosPlace->psgi_app);
$app;

