import 'package:orz/orz.dart';
import 'package:orz/model/blocklyuser.dart';

class Question extends ManagedObject<_Question> implements _Question {}

class _Question {
  @primaryKey
  int id;

  @Column(unique: false)
  String qcontent;

  @Column(unique: false)
  String qanswer;

  @Column(unique: false)
  String qsource;

  ManagedSet<QuestionType> questionTypes;
  ManagedSet<UserFinish> userFinish;
  ManagedSet<UserStore> userStore;
}

class Type extends ManagedObject<_Type> implements _Type {}

class _Type {
  @primaryKey
  int tid;

  @Column(unique: false)
  String tname;

  ManagedSet<QuestionType> questionTypes;


}

class QuestionType extends ManagedObject<_QuestionType> implements _QuestionType {}
class _QuestionType {
  @primaryKey
  int id;  

  @Relate(#questionTypes)
  Question question;

  @Relate(#questionTypes)
  Type type;
}

