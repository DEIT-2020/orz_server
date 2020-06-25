import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';


import 'package:intl/intl.dart';
import 'question_bank_service.dart';

@Component(
  selector: 'question-bank',
  // styleUrls: ['question_bank_component.scss.css'],
  templateUrl: 'question_bank_component.html',
  directives: [
    MaterialAutoSuggestInputComponent,
    MaterialButtonComponent,
    MaterialCheckboxComponent,
    MaterialDropdownSelectComponent,
    MaterialIconComponent,
    
    materialInputDirectives,
    NgFor,
    NgIf,
    DeferredContentDirective,
    MaterialButtonComponent,
    MaterialIconComponent,
    MaterialPersistentDrawerDirective,
    MaterialToggleComponent,
    MaterialListComponent,
    MaterialListItemComponent,
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

class MyView {
  final myOptions = [1, 2, 3];
  int mySelection = 2;
}
class MaterialDrawerExample {
  bool customWidth = false;
  bool end = false;
}