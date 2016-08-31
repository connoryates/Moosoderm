#!/usr/bin/env perl
use strict;
use warnings;

use SQL::Translator;
use DBI;
use FindBin qw/$RealBin/;
use MooX::Types::MooseLike::Base qw(:all);

use lib "$RealBin/../lib";
use Moosoderm;

my ($dsn, $user, $pass) = "";

my $dbh = DBI->connect(
    $dsn,
    $user,
    $pass,
    {
        RaiseError => 1,
        AutoCommit => 1,
    },
);

my $sqlt = SQL::Translator->new(
    parser      => 'DBI',
    parser_args => { dbh => $dbh },
);

$sqlt->parse(undef);

my $scaffold = Moosoderm->new(
    schema       => $sqlt->schema,
    schema_class => 'Example::Schema',
);

$scaffold->produce(\*STDOUT);
