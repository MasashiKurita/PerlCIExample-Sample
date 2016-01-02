package PerlCIExample::ConsumptionTax;

use strict;
use warnings;

use base qw/Class::Accessor::Fast/;

__PACKAGE__->mk_accessors(qw/ consumption_tax_rate /);

sub new {
    my ($class, %params) = @_;

    bless {
        name => $params{name},
    }, $class
}

sub tax_include {
    my ($self, $price) = @_;
    return $price * (1 + $self->consumption_tax_rate);
}

1;
