import 'package:orz_server/orz_server.dart';
class Hero extends ManagedObject<_Hero> implements _Hero {}

class _Hero {
  @primaryKey
  int id;

  @Column(unique: true)
  String name;
}
class User extends ManagedObject<_User> implements _User {}

class _User {
  @primaryKey
  int user_id;

  @Column(unique: true)
  String user_name;

  @Column(unique: true)
  String user_email;

  @Column(unique: true)
  String user_phone;

  @Column(unique: true)
  String user_password;
}

class Administer extends ManagedObject<_Administer> implements _Administer {}

class _Administer {
  @primaryKey
  int administer_id;

  @Column(unique: true)
  String administer_name;

  @Column(unique: true)
  String administer_email;

  @Column(unique: true)
  String administer_phone;

  @Column(unique: true)
  String administer_password;
}

class Question extends ManagedObject<_Question> implements _Question {}

class _Question {
  @primaryKey
  int question_id;

  @Column(unique: true)
  String question_content;

  @Column(unique: false)
  String answer;

  @Column(unique: false)
  String source;
}

class Type extends ManagedObject<_Type> implements _Type {}

class _Type {
  @primaryKey
  int type_id;

  @Column(unique: true)
  String type_name;

}