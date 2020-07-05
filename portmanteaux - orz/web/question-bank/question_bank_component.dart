// Copyright (c) 2012, the Dart project authors.
// Please see the AUTHORS file for details.
// All rights reserved. Use of this source code
// is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:html';
import 'dart:convert';

UListElement wordList;
// TableSectionElement questionBank;
Element questionList;
Element typeList;


void main() {
  // var ele1=document.querySelector('#getWords').onClick.listen(makeRequest2);
  // wordList = querySelector('#wordList') as UListElement;
  questionList=querySelector('#questionList') ;
 
    var path = 'http://localhost:8888/question_bank';
   HttpRequest.getString(path).then((String fileContents) {
    final data = json.decode(fileContents);
    String temp='''<thead>
                             <tr>
                            <th scope="col">id</th>
                            <th scope="col">题干</th>
                            <th scope="col">来源</th>
                            <th scope="col">详情</th>
                        </tr>
                    </thead>
                    <tbody>
                ''';
      List<String> property=['id','qcontent','qsource'];
    for (var i = 0; i < data.length; i++) {
      temp=temp+'<tr>';
      var temp2=data[i]['id'].toString();
      temp=temp+'<td id="$temp2">'+temp2+'</td>';
      for (var j = 1; j < 3; j++){
     temp=temp+'<td>'+data[i][property[j]].toString()+'</td>';
      }
      
      temp=temp+'<td>'+'''<button id="mark$temp2" ><a href='http://127.0.0.1:8080/online-blockly/demos/code/question_bank_detail_component.html'>详情</a></button>'''+'</td>';
    // var ele$temp2=document.querySelector('#mark$temp2').onClick.listen(markRequest);
          temp=temp+'</tr>';
         print(temp);
         
         }
          temp=temp+'</tbody>';
         questionList.innerHtml=temp;
         
        }).catchError((error) {
        print(error.toString());
      });
     // var ele$temp2=document.querySelector('#mark$temp2').onClick.listen(markRequest);
    //
    
     typeList=querySelector('#typeList') ;
     
        var path2 = 'http://localhost:8888/type';
       HttpRequest.getString(path2).then((String fileContents) {
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
    void makeRequest2(Event e) {
      var path1 = 'https://dart.dev/f/portmanteaux.json';
      var path = 'http://127.0.0.1:8888/question_bank';
      var httpRequest = HttpRequest();
      httpRequest
        ..open('GET', path)
        ..onLoadEnd.listen((e) => requestComplete2(httpRequest))
        ..send('');
        print(httpRequest);
    }
    
    void requestComplete2(HttpRequest request) {
      if (request.status == 200) {
        final portmanteaux =
            (json.decode(request.responseText) as List<dynamic>);
        for (var i = 0; i < portmanteaux.length; i++) {
       
          Map<String, dynamic> map =portmanteaux[i];
          wordList.children.add(LIElement()..text = map['qcontent']);
    
          
        }
      } else {
        wordList.children
            .add(LIElement()..text = 'Request failed, status=${request.status}');
      }
    }
    
    
//     void markRequest(MouseEvent event) {
//       print("hello");
// }
