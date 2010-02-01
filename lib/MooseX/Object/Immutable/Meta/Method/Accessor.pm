use MooseX::Declare;

class MooseX::Object::Immutable::Meta::Method::Accessor
  extends Moose::Meta::Method::Accessor is mutable
{
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
}
