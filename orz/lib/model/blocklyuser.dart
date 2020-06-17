import 'package:orz/orz.dart';
import 'package:orz/model/question.dart';

class Blocklyuser extends ManagedObject<_Blocklyuser> implements _Blocklyuser {}

class _Blocklyuser {
  @primaryKey
  int id;

  @Column(unique: true)
  String uname;

  @Column(unique: true)
  String uemail;

  @Column(unique: true)
  String uphone;

  @Column(unique: false)
  String upassword;

  ManagedSet<UserFinish> userFinish;
  ManagedSet<UserStore> userStore;

}

class UserFinish extends ManagedObject<_UserFinish> implements _UserFinish {}

class _UserFinish {
  @primaryKey
  int id;

  int correct;

  @Column(indexed: true)
  DateTime finishtime;

  @Relate(#userFinish)
  Blocklyuser user;

  @Relate(#userFinish)
  Question question;

}

class UserStore extends ManagedObject<_UserStore> implements _UserStore {}

class _UserStore {
  @primaryKey
  int id;

  @Column(indexed: true)
  DateTime storetime;

  @Relate(#userStore)
  Blocklyuser user;

  @Relate(#userStore)
  Question question;

}

