// import { Component, OnInit } from '@angular/core';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:stream_transform/stream_transform.dart';

import '../model/question.dart';
import '../service/question_service.dart';
import '../route_paths.dart';

@Component(
  selector: 'app-search-result',
  templateUrl: 'search_result_component.html',
  styleUrls: ['search_result_component.css'],
  directives: [coreDirectives, QuestionBankComponent, routerDirectives, formDirectives],
  providers: [ClassProvider(QuestionService)],
  
)


// class QuestionBankComponent implements OnInit {
//   List<Question> questions;

//   final QuestionService _questionService;

//   QuestionBankComponent(this._questionService);

//   String heroUrl(int id) => RoutePaths.question.toUrl(parameters: {idParam: '$id'});

//   @override
//   void ngOnInit() async {
//     questions = (await _questionService.getAll()).skip(0).take(4).toList();
//   }
// }
class QuestionBankComponent implements OnActivate {
  Question question;
  final QuestionService _questionbankService;
  final Location _location;

  QuestionBankComponent(this._questionbankService, this._location);

  @override
  void onActivate(_, RouterState current) async {
    final id = getId(current.parameters);
    if (id != null) question = await (_questionbankService.get(id));
  }

  Future<void> save() async {
    await _questionbankService.update(question);
    goBack();
  }

  void goBack() => _location.back();
}



// export class QuestionBankComponent implements OnInit {


//   rankingList: var any;
//    any = [
//     { 'no': 1, 'username': 'uername@qq.com', 'integral': 10, 'tryTime': 20, 'deliveryRate': 20 },
//     { 'no': 2, 'username': 'uername@qq.com', 'integral': 20, 'tryTime': 20, 'deliveryRate': 20 },
//     { 'no': 3, 'username': 'uername@qq.com', 'integral': 30, 'tryTime': 20, 'deliveryRate': 20 },
//     { 'no': 4, 'username': 'uername@qq.com', 'integral': 40, 'tryTime': 20, 'deliveryRate': 20 },
//     { 'no': 5, 'username': 'uername@qq.com', 'integral': 50, 'tryTime': 20, 'deliveryRate': 20 },
//     { 'no': 6, 'username': 'uername@qq.com', 'integral': 60, 'tryTime': 20, 'deliveryRate': 20 },
//     { 'no': 7, 'username': 'uername@qq.com', 'integral': 70, 'tryTime': 20, 'deliveryRate': 20 },
//     { 'no': 8, 'username': 'uername@qq.com', 'integral': 80, 'tryTime': 20, 'deliveryRate': 20 },
//   ];

//   constructor() { }

//   ngOnInit() {
//   }

// }