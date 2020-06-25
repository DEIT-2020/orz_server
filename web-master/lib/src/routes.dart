import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';
import 'dashboard/dashboard_component.template.dart' as dashboard_template;
import 'hero/hero_component.template.dart' as hero_template;
import 'hero-list/hero_list_component.template.dart' as hero_list_template;
import 'question-bank/question_bank_component.template.dart' as question_bank_template;

export 'route_paths.dart';

class Routes {
  static final dashboard = RouteDefinition(
    routePath: RoutePaths.dashboard,
    component: dashboard_template.DashboardComponentNgFactory,
  );

  static final hero = RouteDefinition(
    routePath: RoutePaths.hero,
    component: hero_template.HeroComponentNgFactory,
  );

  static final heroes = RouteDefinition(
    routePath: RoutePaths.heroes,
    component: hero_list_template.HeroListComponentNgFactory,
  );

    static final questionbank = RouteDefinition(
    routePath: RoutePaths.questionbank,
    component: question_bank_template.QuestionBankComponentNgFactory,
  );
     static final question = RouteDefinition(
    routePath: RoutePaths.question,
    component: question_bank_template.QuestionBankComponentNgFactory,
  );
  

  static final all = <RouteDefinition>[
    dashboard,
    hero,
    heroes,
    questionbank,
    question,
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.dashboard.toUrl(),
    ),
  ];
}
