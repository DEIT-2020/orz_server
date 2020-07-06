// Copyright (c) 2012, the Dart project authors.
// Please see the AUTHORS file for details.
// All rights reserved. Use of this source code
// is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:html';
import 'dart:convert';
import 'package:http/http.dart' as http;

UListElement wordList;
UListElement qDetail;
// Element qid;
// Element qcontent;
Element myanswer;
// Element qsource;
String qanswer;
String markid="1";
void main() {
  var ele1=document.querySelector('#postAnswer').onClick.listen(makePostRequest);
    // userList = querySelector('#userList') as UListElement;
    // ele1;
    //querySelector('#userName').text = "abccc";
    //querySelector('#userName').onClick.listen(makeRequest);
    var path = 'http://127.0.0.1:8888/question_bank/$markid';
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
        print(map);
        qanswer=map['qanswer'];
        querySelector('#qContent').text ="题目："+ map['qcontent'];
        querySelector('#qSource').text = "题目来源："+map['qsource'];
  
    } else {
      qDetail=document.querySelector("#qDetail");
      qDetail.children
          .add(LIElement()..text = 'Request failed, status=${request.status}');
    }}

     Future makePostRequest(MouseEvent event) async {
       String correct;
        myanswer=document.querySelector('#myAnswer');
        if (myanswer.toString()==qanswer){
          correct="1";
     window.alert("答案正确！");
    }else{
      correct="0";
      window.alert("答案错误！正确答案是：$qanswer");
    }
    var userid=window.localStorage['userid'].toString();
var path = 'http://127.0.0.1:8888/userfinish/$userid/$markid/$correct';
    // await HttpRequest.request(path,method:'POST',sendData:json.encode(data),Content-Type:"application/json").then((HttpRequest resp){});
   final response = await http.post(path,
        headers: {"content-type": "application/json"}).then((response) {
      
      if (response.statusCode == 200) {
      window.alert("已添加到做题记录！");
      }else window.alert("由于网络故障等原因，未添加到做题记录！");
   
    });
}
  // Future main() async {
  //   // var ele1=document.querySelector('#getWords').onClick.listen(makeRequest2);
  //   // wordList = querySelector('#wordList') as UListElement;
  //   qid=document.querySelector('#qId');
  //   qcontent=document.querySelector('#qContent');
  //   qsource=document.querySelector('#qSource');
  //   myanswer=document.querySelector('#myAnswer');
    
  //   String queryid="1";
  //   var path = 'http://localhost:8888/question_bank/$queryid';
  //   HttpRequest.getString(path).then((String fileContents) {
  //   final data = json.decode(fileContents);
  //   qid.text=data[0]['id'].toString();
  //   qcontent.text=data[0]['qcontent'].toString(); 
  //   qsource.text=data[0]['qsource'].toString();
  //   String qanswer=data[0]['qanswer'].toString();
  //   String myanswer1=(myanswer as InputElement).value;
  //   if (myanswer1==qanswer){
  //    window.alert("答案正确！");
  //   }else{
  //     window.alert("答案错误！正确答案是：$qanswer");
  //   }
  //     }).catchError((error) {
  //     print(error.toString());
  //   });
  
  //
  
   
  
  // }
  
 
