import 'package:orz/orz.dart';

class Question extends ManagedObject<_Question> implements _Question {}

class _Question {
  @primaryKey
  int qid;

  @Column(unique: false)
  String qcontent;

  @Column(unique: false)
  String qanswer;

  @Column(unique: false)
  String qsource;
}
