class Blocklyuser {
final int id;
String uname;
String uemail;
String uphone;
String upassword;

  Blocklyuser(this.id, this.uname, this.uemail, this.uphone, this.upassword);

  factory Blocklyuser.fromJson(Map<String, dynamic> blocklyuser) =>
      Blocklyuser(_toInt(blocklyuser['id']), blocklyuser['uname'], blocklyuser['uemail'], blocklyuser['uphone'], blocklyuser['upassword']);

  Map toJson() => {'id': id, 'uname': uname, 'uemail': uemail, 'uphone': uphone, 'upassword': upassword};
}

int _toInt(id) => id is int ? id : int.parse(id);
