## Copyright (C) Graham Barr
## vim: ts=8:sw=2:expandtab:shiftround

package Moosoderm::Component;
use Moo;

our %Registry;
our $Order = 0xffffffff;

has 'name' => (
  is       => 'ro',
  required => 1,
);

has 'initializer' => (
  is  => 'ro',
);

has 'order' => (
  is      => 'ro',
  default => sub { $Order-- },
);

sub find {
  my ($class, $name) = @_;
  $Registry{$name} ||= __PACKAGE__->new(name => $name);
}

sub BUILD {
  my $self = shift;
  my $name = $self->name;
  die "Component $name already exists\n" if $Registry{$name};
  $Registry{$name} = $self;
}

foreach my $name (qw! Core PK::Auto InflateColumn::DateTime CDBICompat !) {
  __PACKAGE__->new(name => $name);
}

__PACKAGE__->new(name => 'UTF8Columns', initializer => 'utf8_columns');

1;

