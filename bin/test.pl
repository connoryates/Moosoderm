#!/usr/bin/env perl
use strict;
use warnings;

use SQL::Translator;
use DBI;
use FindBin qw/$RealBin/;

use lib "$RealBin/../lib";
use Moosoderm;

my $dbh = DBI->connect(
    'DBI:Pg:database=dbtracker;host=dbtrackerdevdb.steamcourier.com;port=5439',
    'broadbean',
    'TK50z4ZkjOJoL',
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
