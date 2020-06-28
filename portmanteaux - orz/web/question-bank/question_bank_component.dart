// Copyright (c) 2012, the Dart project authors.
// Please see the AUTHORS file for details.
// All rights reserved. Use of this source code
// is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:html';
import 'dart:convert';
import '../model/question.dart';

UListElement wordList;

void main() {
  var ele1=document.querySelector('#getQuestions').onClick.listen(makeRequest);
  wordList = querySelector('#QuestionList') as UListElement;
  ele1;
}
 
void makeRequest(Event e) {
  var path1 = 'https://dart.dev/f/portmanteaux.json';
  var path = 'http://127.0.0.1:8888/question_bank';
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
      wordList.children.add(LIElement()..text = map['qcontent']);
      // //change
      // List<Hero> heroes;
      // for (var i = 0; i < portmanteaux.length; i++) {
      //   Hero h;
      //   Map<int,String> map=portmanteaux[i];
      //   h=Hero(int.parse(map['id']),map['name']);
      //   heroes.add(h);
      // }
      // for (i=0;i<heroes.length;i++){
      //   Hero h2=heroes[i];
      //   wordList.children.add(LIElement()..text = h2.name);
      // }
      
    }
  } else {
    wordList.children
        .add(LIElement()..text = 'Request failed, status=${request.status}');
  }
}


class Question {
  final int id;
  String qcontent;
  String qanswer;
  String qsource;

  Question(this.id, this.qcontent,this.qanswer,this.qsource);

  factory Question.fromJson(Map<String, dynamic> question) =>
      Question(_toInt(question['id']), question['qcontent'],question['qanswer'],question['qsource'],);

  Map toJson() => {'id': id, 'qcontent': qcontent, 'qanswer': qanswer, 'qsource': qsource};
}

int _toInt(id) => id is int ? id : int.parse(id);
