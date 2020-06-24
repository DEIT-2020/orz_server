class Type {
  final int id;
  String tname;


  Type(this.id, this.tname);

  factory Type.fromJson(Map<String, dynamic> type) =>
      Type(_toInt(type['id']), type['tname'] );

  Map toJson() => {'id': id, 'tname': tname};
}

int _toInt(id) => id is int ? id : int.parse(id);
