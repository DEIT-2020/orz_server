import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'hero.dart';
import 'hero_service.dart';
import 'hero_search_component.dart';
import 'question-bank/question_bank_component.dart';
import 'route_paths.dart';

@Component(
  selector: 'my-dashboard',
  templateUrl: 'dashboard_component.html',
  styleUrls: ['dashboard_component.css'],
  directives: [coreDirectives, HeroSearchComponent,QuestionBankComponent, routerDirectives],
)
class DashboardComponent implements OnInit {
  List<Question> questions;

  final HeroService _questionService;

  DashboardComponent(this._questionService);

  String heroUrl(int id) => RoutePaths.question.toUrl(parameters: {idParam: '$id'});

  @override
  void ngOnInit() async {
    questions = (await _questionService.getAll()).skip(0).take(4).toList();
  }
}
