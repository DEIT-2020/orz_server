import 'dart:html';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  // ignore: prefer_single_quotes
  var questionUpdate = document.querySelector("#questionsubmit")
    ..onClick.listen(questionsubmit);
    questionUpdate;
}

void questionsubmit(Event e) async {
  var content = document.querySelector('#questioncontent');
  var answer = document.querySelector('#questionanswer');
  var source = document.querySelector('#questionsource');
    var data = {
      'qcontent': (content as InputElement).value,
      'qanswer': (answer as InputElement).value,
      'qsource': (source as InputElement).value
    };
      
    var path = 'http://127.0.0.1:8888/question_bank';
   final response = await http.post(path,
        body: json.encode(data),
        headers: {"content-type": "application/json"}).then((response) {
      if (response.statusCode == 200) {
      window.alert("上传成功");
      } 
      else window.alert("上传失败！");
   
    });
    ;
  
  }
