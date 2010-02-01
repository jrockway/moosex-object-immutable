package MooseX::Object::Immutable;
use strict;
use warnings;
use Moose::Exporter;

Moose::Exporter->setup_import_methods(
    class_metaroles => {
        instance  => ['MooseX::Object::Immutable::Meta::Instance'],
        class     => ['MooseX::Object::Immutable::Meta::Class'],
        attribute => ['MooseX::Object::Immutable::Meta::Attribute'],
    },
    base_class_roles => ['MooseX::Clone'],
);

1;
