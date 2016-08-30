# Moosoderm

Generate DBIx::Class classes using Moo. Rework of Graham Barr's [Mesoderm](https://github.com/gbarr/Mesoderm) using Moo.

Moosoderm creates a scaffold of code for [DBIx::Class](http://search.cpan.org/perldoc?DBIx::Class) using a schema
object from [SQL::Translator](http://github.com/arcanez/SQL-Translator).

## Features

  * All generated code is in a single file
  * Generated code is in a predicatable order, so diffs are easily readable
  * Separation between generated code and user written code
  * User code is written as [Moo::Role](http://search.cpan.org/perldoc?Moo::Role) classes
  * Complete control over class and relationship names
  * Ability to have class model exclude any table, column or relationship

## License

This software is copyright (c) 2010-2011 by Graham Barr <gbarr@pobox.com>

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.