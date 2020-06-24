// import { Component, OnInit } from '@angular/core';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import '../question.dart';
import '../question_service.dart';
// import 'hero_search_component.dart';
import '../route_paths.dart';

@Component(
  selector: 'app-question-bank',
  templateUrl: './question_bank_component.html',
  styleUrls: ['./question_bank_component.scss'],
  directives: [coreDirectives, QuestionBankComponent, routerDirectives],

)

// export class QuestionBankComponent implements OnInit {


//   rankingList: any[] = [
//     { no: 1, username: 'uername@qq.com', integral: 10, tryTime: 20, deliveryRate: 20 },
//     { no: 2, username: 'uername@qq.com', integral: 20, tryTime: 20, deliveryRate: 20 },
//     { no: 3, username: 'uername@qq.com', integral: 30, tryTime: 20, deliveryRate: 20 },
//     { no: 4, username: 'uername@qq.com', integral: 40, tryTime: 20, deliveryRate: 20 },
//     { no: 5, username: 'uername@qq.com', integral: 50, tryTime: 20, deliveryRate: 20 },
//     { no: 6, username: 'uername@qq.com', integral: 60, tryTime: 20, deliveryRate: 20 },
//     { no: 7, username: 'uername@qq.com', integral: 70, tryTime: 20, deliveryRate: 20 },
//     { no: 8, username: 'uername@qq.com', integral: 80, tryTime: 20, deliveryRate: 20 },
//   ]

//   constructor() { }

//   ngOnInit() {
//   }

// }
class QuestionBankComponent implements OnInit {
  List<Question> questions;

  final QuestionService _questionService;

  QuestionBankComponent(this._questionService);

  String heroUrl(int id) => RoutePaths.question.toUrl(parameters: {idParam: '$id'});

  @override
  void ngOnInit() async {
    questions = (await _questionService.getAll()).skip(0).take(4).toList();
  }
}
