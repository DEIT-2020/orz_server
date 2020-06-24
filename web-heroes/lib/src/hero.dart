class Question {
  final int id;
  String qcontent;
  String qanswer;
  String qsource;

  Question(this.id, this.qcontent,this.qanswer,this.qsource);

  factory Question.fromJson(Map<String, dynamic> question) =>
      Question(_toInt(question['id']), question['qcontent'], question['qanswer'], question['qsource']);

  Map toJson() => {'id': id, 'qcontent': qcontent,'qanswer':qanswer,'qsource':qsource};
}

int _toInt(id) => id is int ? id : int.parse(id);
