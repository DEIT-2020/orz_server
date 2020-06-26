import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

import '../model/blocklyuser.dart';

class BlocklyuserService {
  static final _headers = {'Content-Type': 'application/json'};
  static const _blocklyuserUrl = 'api/personal-bank'; // URL to web API

  final Client _http;

  BlocklyuserService(this._http);

  Future<List<Blocklyuser>> getAll() async {
    try {
      final response = await _http.get(_blocklyuserUrl);
      final questions = (_extractData(response) as List)
          .map((json) => Blocklyuser.fromJson(json))
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

  Future<Blocklyuser> get(int id) async {
    try {
      final response = await _http.get('$_blocklyuserUrl/$id');
      return Blocklyuser.fromJson(_extractData(response));
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<Blocklyuser> create(String qcontent,String qanswer,String qsource) async {
    try {
      final response = await _http.post(_blocklyuserUrl,
          headers: _headers, body: json.encode({'qcontent': qcontent,'qanswer':qanswer,'qsource':qsource}));
      return Blocklyuser.fromJson(_extractData(response));
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<Blocklyuser> update(Blocklyuser question) async {
    try {
      final url = '$_blocklyuserUrl/${question.id}';
      final response =
          await _http.put(url, headers: _headers, body: json.encode(question));
      return Blocklyuser.fromJson(_extractData(response));
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<void> delete(int id) async {
    try {
      final url = '$_blocklyuserUrl/$id';
      await _http.delete(url, headers: _headers);
    } catch (e) {
      throw _handleError(e);
    }
  }
}
