import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import 'src/todo_list/todo_list_component.dart';
import 'src/question_bank/question_bank_component.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [TodoListComponent,QuestionBankComponent,formDirectives],
)
class AppComponent {
  // Nothing here yet. All logic is in TodoListComponent.
}

