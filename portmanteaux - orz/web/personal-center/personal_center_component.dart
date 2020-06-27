
import 'dart:html';
import 'dart:convert';

UListElement wordList;

void main() {
  var ele1=document.querySelector('#getWords').onClick.listen(makeRequest);
  wordList = querySelector('#wordList') as UListElement;
  ele1;
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
      // var portmanteaux_str=jsonEncode(portmanteaux[i]);//json_encode： json对象转json字符串
      // Map<String, dynamic> map = json.decode(portmanteaux_str);//json_decode： json字符串转json对象
      Map<String, dynamic> map =portmanteaux[i];
      wordList.children.add(LIElement()..text = map['name']);
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

class Hero {
  final int id;
  String name;

  Hero(this.id, this.name);

  factory Hero.fromJson(Map<String, dynamic> hero) =>
      Hero(_toInt(hero['id']), hero['name']);

  Map toJson() => {'id': id, 'name': name};
}

int _toInt(id) => id is int ? id : int.parse(id);