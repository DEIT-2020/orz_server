import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

import '../model/question.dart';

class QuestionService {
  static final _headers = {'Content-Type': 'application/json'};
  static const _questionsUrl = 'api/questionbank'; // URL to web API

  final Client _http;

  QuestionService(this._http);

  Future<List<Question>> getAll() async {
    try {
      final response = await _http.get(_questionsUrl);
      final questions = (_extractData(response) as List)
          .map((json) => Question.fromJson(json))
          .toList();
      return questions;
    } catch (e) {
      throw _handleError(e);
    }
  }

  dynamic _extractData(Response resp) => json.decode(resp.body)['data'];

  Exception _handleError(dynamic e) {
    print(e); // for demo purposes only
    return Exception('Server error; cause: $e');
  }

  Future<Question> get(int id) async {
    try {
      final response = await _http.get('$_questionsUrl/$id');
      return Question.fromJson(_extractData(response));
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<Question> create(String qcontent,String qanswer,String qsource) async {
    try {
      final response = await _http.post(_questionsUrl,
          headers: _headers, body: json.encode({'qcontent': qcontent,'qanswer':qanswer,'qsource':qsource}));
      return Question.fromJson(_extractData(response));
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<Question> update(Question question) async {
    try {
      final url = '$_questionsUrl/${question.id}';
      final response =
          await _http.put(url, headers: _headers, body: json.encode(question));
      return Question.fromJson(_extractData(response));
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<void> delete(int id) async {
    try {
      final url = '$_questionsUrl/$id';
      await _http.delete(url, headers: _headers);
    } catch (e) {
      throw _handleError(e);
    }
  }
}
