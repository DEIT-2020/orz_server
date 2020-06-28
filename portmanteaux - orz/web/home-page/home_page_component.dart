// Copyright (c) 2012, the Dart project authors.
// Please see the AUTHORS file for details.
// All rights reserved. Use of this source code
// is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:html';
import 'dart:convert';


Element typeList;

void main() {
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
 

