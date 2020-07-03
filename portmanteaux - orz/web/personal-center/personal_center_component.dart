import 'dart:html';
import 'dart:convert';
import 'package:http/http.dart' as http;

UListElement userList;
InputElement userinput;

void main() {
  // ignore: prefer_single_quotes
  var userSubmit = document.querySelector("#usersubmit")
    ..onClick.listen(usersubmit);
    userSubmit;
}

void usersubmit(Event e) async {
  var name = document.querySelector('#UserName');
  var password1 = document.querySelector('#UserPassword1');
  var password2 = document.querySelector('#UserPassword2');
  if ((password1 as InputElement).value != (password2 as InputElement).value)
  {window.alert("两次密码输入不同！");}
  else{
     var email = document.querySelector('#UserEmail');
     var phonenumber = document.querySelector('#UserPhonenumber');
     var data = {
      'uname': (name as InputElement).value,
      'upassword': (password1 as InputElement).value,
      'uemail':(email as InputElement).value,
      'uphone':(phonenumber as InputElement).value
    };
      
    var path = 'http://127.0.0.1:8888/personal_center/1';
   final response = await http.put(path,
        body: json.encode(data),
        headers: {"content-type": "application/json"}).then((response) {
      if (response.statusCode == 200) { window.alert("修改成功");} 
      else if(response.statusCode == 409){window.alert("修改失败！手机号或邮箱已存在！");}
      else window.alert("修改失败！");});
    ;
  }}

  
 

// void main() {
//   // var ele1=document.querySelector('#getUser').onClick.listen(makeRequest);
//   // userList = querySelector('#userList') as UListElement;
//   // ele1;
//   //querySelector('#userName').text = "abccc";
//   //querySelector('#userName').onClick.listen(makeRequest);
//   var path = 'http://127.0.0.1:8888/personal_center/1';
//   var httpRequest = HttpRequest();
//   httpRequest
//     ..open('PUT', path)
//     ..onLoadEnd.listen((e) => requestComplete(httpRequest))
//     ..send('');
// }


//  void requestComplete(HttpRequest request) {
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
//   }}