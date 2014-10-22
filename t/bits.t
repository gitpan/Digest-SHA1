#!perl -w

use Test qw(plan ok);
plan tests => 2;

use Digest::SHA1;

my $sha1 = Digest::SHA1->new;

if ($Digest::base::VERSION) {
    $sha1->add_bits("01111111");
    ok($sha1->hexdigest, "23833462f55515a900e016db2eb943fb474c19f6");
    eval {
	$sha1->add_bits("0111");
    };
    ok($@ =~ /must be multiple of 8/);
}
else {
    print "# No Digest::base\n";
    eval {
	$sha1->add_bits("foo");
    };
    ok($@ =~ /^Can\'t locate Digest\/base\.pm in \@INC/);
    ok(1);  # dummy
}

