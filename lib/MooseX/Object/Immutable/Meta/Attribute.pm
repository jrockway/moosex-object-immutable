use MooseX::Declare;
use MooseX::Object::Immutable::Meta::Method::Accessor;

role MooseX::Object::Immutable::Meta::Attribute {
    use Hash::Util qw(lock_ref_keys_plus lock_hashref unlock_hashref);
    use Guard;

    around set_initial_value($instance, $value) {
        unlock_hashref($instance);
        my $g = guard { lock_hashref($instance) };
        lock_ref_keys_plus($instance, $self->name);

        $self->$orig($instance, $value);
    }

    around set_value($instance, $value){
        my $name = $self->name;
        my $cloning = '$__CLONE';

        unlock_hashref($instance);
        my $g = guard {
            delete $instance->{$cloning};
            lock_hashref($instance);
        };

        if(exists $instance->{$cloning} && $instance->{$cloning}){
            return $self->$orig($instance, $value);
        }

        lock_ref_keys_plus($instance, $cloning);
        $instance->{$cloning} = 1;

        return $instance->clone( $name => $value );
    }

    override accessor_metaclass {
        'MooseX::Object::Immutable::Meta::Method::Accessor';
    }

}
