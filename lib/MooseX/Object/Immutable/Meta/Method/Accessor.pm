package MooseX::Object::Immutable::Meta::Method::Accessor;
use strict;
use warnings;

use parent 'Moose::Meta::Method::Accessor';

sub _generate_accessor_method {
    my $attr = (shift)->associated_attribute;
    return sub {
        return $attr->set_value($_[0], $_[1]) if scalar(@_) == 2;
        return $attr->get_value($_[0]);
    };
}

sub _generate_writer_method {
    my $attr = (shift)->associated_attribute;
    return sub {
        return $attr->set_value($_[0], $_[1]);
    };
}

1;
