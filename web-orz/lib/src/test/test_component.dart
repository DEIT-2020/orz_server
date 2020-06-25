import 'package:angular/angular.dart';

import 'package:angular_components/angular_components.dart';


import 'package:intl/intl.dart';
import '../question_bank/question_bank_service.dart';

import 'dart:html';
import 'dart:convert';

@Component(

  selector: 'mat-drawer-demo',

  directives: [
TestComponent

  ],

  templateUrl: 'test_component.html',

  // styleUrls: [

  //   // 'test_component.scss.css',

  //   'package:angular_components/app_layout/layout.scss.css',

  // ],
   providers: [ClassProvider(QuestionBankService)],

)


class TestComponent implements OnInit {
  
UListElement wordList;
  querySelector('#getWords').onClick.listen(makeRequest);
  UListElement wordList= querySelector('#wordList') as UListElement;


 
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

  @override
  void ngOnInit() {
    // TODO: implement ngOnInit
  }
}