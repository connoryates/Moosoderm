## Copyright (C) Graham Barr
## vim: ts=8:sw=2:expandtab:shiftround

package Moosoderm::Mapping;

use Moo;

has name     => (is => 'rw');
has accessor => (is => 'rw');
has left     => (is => 'rw');
has right    => (is => 'rw');

1;

