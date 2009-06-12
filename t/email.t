use strict;
use Test::More tests => 1;
use Email::Send::Test;
use FindBin;
use lib "$FindBin::Bin/../lib";
use BoyosPlace::Email;

my $email = BoyosPlace::Email->new(
        to      => 'dhoss@cpan.org',
        from    => 'devin.austin@gmail.com',
        subject => "testing",
        data    => "testing zee test",
);

my $ok = $email->send;
ok $ok, "Email sent ok";
