use strict;
use Test::Most qw[ defer_plan die ];
use Email::Send::Test;
use FindBin;
use lib "$FindBin::Bin/../lib";
use BoyosPlace::Email;

my $email = BoyosPlace::Email->new(
        email_send_object => Email::Send->new({ mailer => 'Test' }),
        mailer  =>  'Test',
        to      => 'dhoss@cpan.org',
        from    => 'devin.austin@gmail.com',
        subject => "testing",
        data    => "testing zee test",
);

lives_ok{ $email->send }, "Email sent ok";
