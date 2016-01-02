use strict;
use warnings;

use Test::More;

plan (tests => 5);

# 正しくuseできるかどうか
use_ok("PerlCIExample::ConsumptionTax");

my $consumption_jp = new PerlCIExample::ConsumptionTax->new({
    consumption_tax_rate => 0.05,
});

# tax_includeという関数を実装しているか
can_ok($consumption_jp, 'tax_include');

# 小数点以下の出ない値
my $price = 100;

my $price_in_tax = $consumption_jp->tax_include($price);

is($price_in_tax, 105, '期待値と一致');

# 小数点以下が出る値
$price = 128;

$price_in_tax = $consumption_jp->tax_include($price);

is($price_in_tax, 134, '期待値と一致');

# 小数点が含まれる値
my $price_in_point = 100.50;

$price_in_tax = $consumption_jp->tax_include($price_in_point);

is($price_in_tax, 105, '期待値と一致');

