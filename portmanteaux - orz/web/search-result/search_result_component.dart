// Copyright (c) 2012, the Dart project authors.
// Please see the AUTHORS file for details.
// All rights reserved. Use of this source code
// is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:html';
import 'dart:convert';
import 'package:http/http.dart' as http;

UListElement wordList;
// TableSectionElement questionBank;
Element questionList;
InputElement keywords;
Element getsearch;

void main() {
   questionList=querySelector('#questionList') ;
  keywords=querySelector('#Keywords');
   getsearch = document.querySelector('#getSearch')
    ..onClick.listen(searchquestion);
      var path = 'http://localhost:8888/question_bank';
   HttpRequest.getString(path).then((String fileContents) {
    var data = json.decode(fileContents);
    String temp='''<thead>
                             <tr>
                            <th scope="col">id</th>
                            <th scope="col">题干</th>
                            <th scope="col">来源</th>
                        </tr>
                    </thead>
                    <tbody>
                ''';
      List<String> property=['id','qcontent','qsource'];
    for (var i = 0; i < data.length; i++) {
      temp=temp+'<tr>';
      for (var j = 0; j < 3; j++){
     temp=temp+'<td>'+data[i][property[j]].toString()+'</td>';
      }
      temp=temp+'</tr>';
     }
     print(temp);
      temp=temp+'</tbody>';
     questionList.innerHtml=temp;
    }).catchError((error) {
    print(error.toString());
  });

}

void searchquestion(Event e) async {

  print(keywords);
    String searchdata = ((keywords as InputElement).value).toString();
    print(searchdata);
     var path2 = 'http://localhost:8888/search?name=$searchdata';
   HttpRequest.getString(path2).then((String fileContents) {
    var data = json.decode(fileContents);

    String temp='''<thead>
                             <tr>
                            <th scope="col">id</th>
                            <th scope="col">题干</th>
                            <th scope="col">来源</th>
                        </tr>
                    </thead>
                    <tbody>
                ''';
      List<String> property=['id','qcontent','qsource'];
    for (var i = 0; i < data.length; i++) {
      temp=temp+'<tr>';
      for (var j = 0; j < 3; j++){
     temp=temp+'<td>'+data[i][property[j]].toString()+'</td>';
      }
      temp=temp+'</tr>';
     print(temp);
     }
      temp=temp+'</tbody>';
     questionList.innerHtml=temp;
    }).catchError((error) {
    print(error.toString());
  });
    
  }
