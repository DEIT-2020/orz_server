class Question {
  final int id;
  String qcontent;
  

  Question(this.id, this.qcontent);

  factory Question.fromJson(Map<String, dynamic> question) =>
      Question(_toInt(question['id']), question['qcontent']);

  Map toJson() => {'id': id, 'qcontent': qcontent};
}

int _toInt(id) => id is int ? id : int.parse(id);
