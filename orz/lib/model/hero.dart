import 'package:orz/orz.dart';
// This declares a Hero entity. Entities are always made up of two classes.

// The _Hero class is a direct mapping of a database table. 

// The other class, Hero, is what we work with in our code - when we fetch heroes from a database, they will be instances of Hero.

class Hero extends ManagedObject<_Hero> implements _Hero {}

class _Hero {
  @primaryKey
  int id;

  @Column(unique: true)
  String name;
}
