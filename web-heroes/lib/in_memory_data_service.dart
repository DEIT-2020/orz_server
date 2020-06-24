// Note: MockClient constructor API forces all InMemoryDataService members to
// be static.
import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart';
import 'package:http/testing.dart';

import 'src/hero.dart';

class InMemoryDataService extends MockClient {
  static final _initialHeroes = [
    // {'id': 1, 'qcontent': '小梅数她家的鸡与兔，数头有16个，数脚有44只。问：小梅家的鸡与兔各有多少只？'},
    // {'id': 2, 'qcontent': '一个笼子鸡和兔共有35个头，94只脚，问鸡有多少只？'},
    // {'id': 3, 'qcontent': '鸡兔共100只，鸡的腿比兔的腿少28条，问鸡有几只？'},
    // {'id': 4, 'qcontent': '试验小学进行数学竞赛，每做对1题得9分，做错1题倒扣3分，共有12道题，小旺得了84分，求小旺做错了几道题？'},
    // {'id': 5, 'qcontent': '一个牧场长满青草，牛在吃草而草又在不断生长，已知牛27头，6天把草吃尽，同样一片牧场，牛23头，9天把草吃尽。如果有牛21头，几天能把草吃尽？'},
    // {'id': 6, 'qcontent': '一片牧场南面一块15公顷的牧场上长满牧草，牧草每天都在匀速生长,这片牧场可供12头牛吃25天，或者供24头牛吃10天。在东升牧场的西侧有一块60公顷的牧场，20天中可供多少头牛吃草？'},
    // {'id': 7, 'qcontent': '一个数被3除余1，被4除余2，被5除余4。这个数最小是几？'},
    // {'id': 8, 'qcontent': '一个数被3除余2。被7除余4。被8除余5。这个数最小是几？'},
    // {'id': 9, 'qcontent': '一个数除以5余4，除以8余3，除以11余2，求满足条件的最小的自然数。'},
    // {'id': 10, 'qcontent': '100以内既能被2整除，又能被3整除的正整数有几个？'}
       {'id': 1, 'qcontent': 'hello'},
    {'id': 2, 'qcontent': '123212'},
    {'id': 3, 'qcontent': '111'},
    {'id': 4, 'qcontent': '222'},
    {'id': 5, 'qcontent': '444'},
    {'id': 6, 'qcontent': '555'},
    {'id': 7, 'qcontent': '666'},
    {'id': 8, 'qcontent': '777'},
    {'id': 9, 'qcontent': '777'},
    {'id': 10, 'qcontent': '777'}
  ];
  static List<Question> _heroesDb;
  static int _nextId;

  static Future<Response> _handler(Request request) async {
    if (_heroesDb == null) resetDb();
    var data;
    switch (request.method) {
      case 'GET':
        final id = int.tryParse(request.url.pathSegments.last);
        if (id != null) {
          data = _heroesDb
              .firstWhere((question) => question.id == id); // throws if no match
        } else {
          String prefix = request.url.queryParameters['name'] ?? '';
          final regExp = RegExp(prefix, caseSensitive: false);
          data = _heroesDb.where((question) => question.qcontent.contains(regExp)).toList();
        }
        break;
      case 'POST':
        var qcontent = json.decode(request.body)['qcontent'];
        var qanswer = json.decode(request.body)['qanswer'];
        var qsource = json.decode(request.body)['qsource'];

        var newHero = Question(_nextId++, qcontent,qanswer,qsource);
        _heroesDb.add(newHero);
        data = newHero;
        break;
      case 'PUT':
        var heroChanges = Question.fromJson(json.decode(request.body));
        var targetHero = _heroesDb.firstWhere((h) => h.id == heroChanges.id);
        targetHero.qcontent = heroChanges.qcontent;
        data = targetHero;
        break;
      case 'DELETE':
        var id = int.parse(request.url.pathSegments.last);
        _heroesDb.removeWhere((hero) => hero.id == id);
        // No data, so leave it as null.
        break;
      default:
        throw 'Unimplemented HTTP method ${request.method}';
    }
    return Response(json.encode({'data': data}), 200,
        headers: {'content-type': 'application/json'});
  }

  static resetDb() {
    _heroesDb = _initialHeroes.map((json) => Question.fromJson(json)).toList();
    _nextId = _heroesDb.map((hero) => hero.id).fold(0, max) + 1;
  }

  static String lookUpName(int id) =>
      _heroesDb.firstWhere((hero) => hero.id == id, orElse: null)?.qcontent;

  InMemoryDataService() : super(_handler);
}
