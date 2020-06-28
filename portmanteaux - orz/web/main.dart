// Copyright (c) 2012, the Dart project authors.
// Please see the AUTHORS file for details.
// All rights reserved. Use of this source code
// is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:html';
import 'dart:convert';

UListElement wordList;
Element typeList;

void main() {
  // var ele1=document.querySelector('#getWords').onClick.listen(makeRequest);
  // wordList = querySelector('#wordList') as UListElement;
  typeList=querySelector('#typeList') ;
 
    var path = 'http://localhost:8888/type';
   HttpRequest.getString(path).then((String fileContents) {
    final data = json.decode(fileContents);
    String temp='';
      // List<String> property=['id','tname'];
    for (var i = 0; i < 4; i++) {
      temp=temp+'''<div class="gallerylist-wrapper" > <a class="popup-with-zoom-anim" href="#small-dialog1">
          <img src="../images/type$i.jpg"  alt="Image 1"/>
          <span><img src="../images/plus.png" alt=" "/> </span>
          <div class="desc">''';
     temp=temp+'<h2>'+data[i]['tname'].toString()+'</h2></div></a></div>';
     print(temp);
     }
     typeList.innerHtml=temp;
    }).catchError((error) {
    print(error.toString());
  });

}
 
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
      Map<String, dynamic> map =portmanteaux[i];
      wordList.children.add(LIElement()..text = map['name']);
    
    }
  } else {
    wordList.children
        .add(LIElement()..text = 'Request failed, status=${request.status}');
  }
}

class Hero {
  final int id;
  String name;

  Hero(this.id, this.name);

  factory Hero.fromJson(Map<String, dynamic> hero) =>
      Hero(_toInt(hero['id']), hero['name']);

  Map toJson() => {'id': id, 'name': name};
}

int _toInt(id) => id is int ? id : int.parse(id);
