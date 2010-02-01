use strict;
use warnings;
use Test::More;

use MooseX::Declare;

{ package Class;
  use Moose;
  use MooseX::Object::Immutable;

    has 'foo' => (
        is       => 'rw',
        required => 1,
    );
}

ok(Class->does('MooseX::Clone'), 'role applied ok');

my $c = Class->new( foo => 42 );
is $c->foo, 42, 'reader works';
$c->foo( 1 );
is $c->foo, 42, 'MY EYES! THE GOGGLES DO NOTHING! (writer is no-op)';
my $c2 = $c->foo(1);
is $c2->foo, 1, 'this worked';
is $c->foo, 42, 'original still sticks';
my $c3 = $c2->foo(123);
is $c3->foo, 123, 'c3 ok';
is $c2->foo, 1, 'c2 ok';
is $c->foo, 42, 'c ok';

done_testing;
