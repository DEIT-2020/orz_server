import 'dart:html';
import 'dart:convert';
import 'package:http/http.dart' as http;

UListElement userList;
InputElement userinput;

void main() {
  // var ele1=document.querySelector('#getUser').onClick.listen(makeRequest);
  // userList = querySelector('#userList') as UListElement;
  // ele1;
  //querySelector('#userName').text = "abccc";
  //querySelector('#userName').onClick.listen(makeRequest);
  var path = 'http://127.0.0.1:8888/personal_center/1';
  var httpRequest = HttpRequest();
  httpRequest
    ..open('GET', path)
    ..onLoadEnd.listen((e) => requestComplete(httpRequest))
    ..send('');
}


 void requestComplete(HttpRequest request) {
  if (request.status == 200) {
    final portmanteaux =
        (json.decode(request.responseText));
      Map<String, dynamic> map =portmanteaux;
      querySelector('#userName').text = "用户名："+map['uname'];
      querySelector('#userPassword').text = "密码："+map['upassword'];
      querySelector('#userEmail').text = "邮箱："+map['uemail'];
      querySelector('#userPhonenumber').text = "手机号："+map['uphone'];

  } else {
    userList.children
        .add(LIElement()..text = 'Request failed, status=${request.status}');
  }}
// void makeRequest(Event e) {
//   var path = 'http://127.0.0.1:8888/personal_center/1';
//   var httpRequest = HttpRequest();
//   httpRequest
//     ..open('GET', path)
//     ..onLoadEnd.listen((e) => requestComplete(httpRequest))
//     ..send('');
// }

// void requestComplete(HttpRequest request) {
//   if (request.status == 200) {
//     final portmanteaux =
//         (json.decode(request.responseText));
//       Map<String, dynamic> map =portmanteaux;
//       querySelector('#userName').text = map['uname'];
//       querySelector('#userPassword').text = map['upassword'];
//       querySelector('#userEmail').text = map['uemail'];
//       querySelector('#userPhonenumber').text = map['uphone'];

//   } else {
//     userList.children
//         .add(LIElement()..text = 'Request failed, status=${request.status}');
//   }
// }

// class Hero {
//   final int id;
//   String name;

//   Hero(this.id, this.name);

//   factory Hero.fromJson(Map<String, dynamic> hero) =>
//       Hero(_toInt(hero['id']), hero['name']);

//   Map toJson() => {'id': id, 'name': name};
// }

// int _toInt(id) => id is int ? id : int.parse(id);
