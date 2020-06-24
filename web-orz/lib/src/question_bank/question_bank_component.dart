import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'question_bank_service.dart';

@Component(
  selector: 'question-bank',
  styleUrls: ['question_bank_component.css'],
  templateUrl: 'question_bank_component.html',
  directives: [
    NgFor,
    NgIf,
  ],
  providers: [ClassProvider(QuestionBankService)],
)
class QuestionBankComponent implements OnInit {
  final QuestionBankService questionBankService;

  List<String> items = [];
  String newTodo = '';

  QuestionBankComponent(this.questionBankService);

  @override
  Future<Null> ngOnInit() async {
    items = await questionBankService.getType();
  }

  void add() {
    items.add(newTodo);
    newTodo = '';
  }

  String remove(int index) => items.removeAt(index);
}
