import 'dart:async';

import 'package:angular/core.dart';

import 'dart:html';
import 'dart:convert';

/// Mock service emulating access to a to-do list stored on a server.
@Injectable()
class testService {

// UListElement wordList;
  querySelector('#getWords').onClick.listen(makeRequest);
  UListElement wordList= querySelector('#wordList') ;


 
void makeRequest(Event e) {
  var path1 = 'https://dart.dev/f/portmanteaux.json';
  var path = 'http://127.0.0.1:8888/heroes';
  var httpRequest = HttpRequest();
  httpRequest
    ..open('GET', path)
    ..onLoadEnd.listen((e) => requestComplete(httpRequest))
    ..send('');
}

void requestComplete(HttpRequest request) {
  if (request.status == 200) {
    final portmanteaux =
        (json.decode(request.responseText) as List<dynamic>);
    for (var i = 0; i < portmanteaux.length; i++) {
      // var portmanteaux_str=jsonEncode(portmanteaux[i]);//json_encode： json对象转json字符串
      // Map<String, dynamic> map = json.decode(portmanteaux_str);//json_decode： json字符串转json对象
      Map<String, dynamic> map =portmanteaux[i];
      wordList.children.add(LIElement()..text = map['name']);
    }
  } else {
    wordList.children
        .add(LIElement()..text = 'Request failed, status=${request.status}');
  }
}

  Future<List<String>> getTodoList() async => wordList;
}
