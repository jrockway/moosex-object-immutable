use inc::Module::Install;
use strict;

name 'MooseX-Object-Immutable';
all_from 'lib/MooseX/Object/Immutable.pm';

requires 'MooseX::Declare';
requires 'Moose' => 0.94;
requires 'MooseX::Clone';
requires 'parent';

WriteAll;
