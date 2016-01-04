use strict;
use Test::More 0.98;
use PerlCIExample::Sample;

my $sample = new PerlCIExample::Sample->new({
    consumption_tax_rate => 0.08,
    exchange_rate => 120,
});

can_ok($sample, 'dollar2yen');
can_ok($sample, 'tax_include');

my $dollar = 10;
my $yen = $sample->dollar2yen($dollar);
is($yen, 1200, 'Unmatched');

my $price = 101;
my $price_in_tax = $sample->tax_include($price);
is($price_in_tax, 109, 'Unmatched');

done_testing();
 
