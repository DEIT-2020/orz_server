import 'dart:html';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  // ignore: prefer_single_quotes
  var userRegister = document.querySelector("#login")
    ..onClick.listen(login);
    userRegister;
}

void login(Event e) async {
  var phone = document.querySelector('#Phone');
  var password = document.querySelector('#Password');
  var phone1=(phone as InputElement).value;
  var password1=(password as InputElement).value;
  var path = 'http://127.0.0.1:8888/login/$phone1';
  print(path);
  print(phone1);
  HttpRequest.getString(path).then((String fileContents) {
    final data = json.decode(fileContents);
    if (password1==data['upassword']){
        window.alert('登录成功！');
        window.location.href='../home-page/home_page_component.html'; 
    }else{
      window.alert('密码错误！');
    }
    
    }).catchError((error) {
    print(error.toString());
    window.alert('登录失败！没有该用户或网络信号不佳。');
   
  });
  }
