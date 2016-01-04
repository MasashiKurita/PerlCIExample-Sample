package PerlCIExample::Sample;
use 5.008001;
use strict;
use warnings;

use base qw(Class::Accessor);
use Math::Round;


__PACKAGE__->mk_accessors(qw(consumption_tax_rate exchange_rate));

sub dollar2yen {
    my ($self, $amount) = @_;
    return round($amount * $self->exchange_rate);
}

sub tax_include {
    my ($self, $price) = @_;
    return round($price * (1 + $self->consumption_tax_rate));
}

1;

