use MooseX::Declare;

role MooseX::Object::Immutable::Meta::Instance {
    use Hash::Util qw(lock_hashref);

    around create_instance(@args){
        my $instance = $self->$orig(@args);
        return lock_hashref($instance);
    }
}
