# Moosoderm

Generate DBIx::Class classes using Moo. Rework of Graham Barr's [Mesoderm](https://github.com/gbarr/Mesoderm) using Moo.

Moosoderm creates a scaffold of code for [DBIx::Class](http://search.cpan.org/perldoc?DBIx::Class) using a schema
object from [SQL::Translator](http://github.com/arcanez/SQL-Translator).

For when your project won't allow for Moose dependencies, but you still want a powerful database scaffold.

## Features

  * All generated code is in a single file
  * Generated code is in a predicatable order, so diffs are easily readable
  * Separation between generated code and user written code
  * User code is written as [Moo::Role](http://search.cpan.org/perldoc?Moo::Role) classes
  * Complete control over class and relationship names
  * Ability to have class model exclude any table, column or relationship

## Usage

```perl
  use Moosoderm;
  use SQL::Translator;
  use DBI;

  my $dbh = DBI->connect($dsn, $user, $pass);

  my $sqlt = SQL::Translator->new( parser_args => { dbh => $dbh }, from => 'DBI');
  $sqlt->parse(undef);

  my $scaffold = Moosoderm->new(
    schema       => $sqlt->schema,
    schema_class => 'My::Schema',
  );

  $scaffold->produce(\*STDOUT);
```

## License

Perl 5
