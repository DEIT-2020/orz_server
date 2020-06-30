import 'dart:html';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  // ignore: prefer_single_quotes
  var userRegister = document.querySelector("#register")
    ..onClick.listen(register);
    userRegister;
}

void register(Event e) async {
  var name = document.querySelector('#UserName');
  var password1 = document.querySelector('#UserPassword1');
  var password2 = document.querySelector('#UserPassword2');
  if((name as InputElement).value == "UserName"){window.alert("请输入用户名");}
  else{
    if((password1 as InputElement).value != (password2 as InputElement).value)
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
    
    var path = 'http://127.0.0.1:8888/personal_center';
    // await HttpRequest.request(path,method:'POST',sendData:json.encode(data),Content-Type:"application/json").then((HttpRequest resp){});
   final response = await http.post(path,
        body: json.encode(data),
        headers: {"content-type": "application/json"}).then((response) {
      
      if (response.statusCode == 200) {
      window.alert("注册成功");
      } else if(response.statusCode==409){
        window.alert("用户名或手机或邮箱已被使用！");
      }else window.alert("注册失败！");
   
    });
    ;
  }}
  
  }
