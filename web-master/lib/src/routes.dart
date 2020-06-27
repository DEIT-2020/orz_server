import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';
import 'dashboard/dashboard_component.template.dart' as dashboard_template;
import 'hero/hero_component.template.dart' as hero_template;
import 'hero/hero-list/hero_list_component.template.dart' as hero_list_template;
import 'question-bank/question_bank_component.template.dart' as question_bank_template;
import 'home-page/home_page_component.template.dart' as home_page_template;
import 'login/login_component.template.dart' as login_template;
import 'online-blockly/online_blockly_component.template.dart' as online_blockly_template;
import 'personal-center/personal_center_component.template.dart' as personal_center_template;
import 'personal-store/personal_store_component.template.dart' as personal_store_template;
import 'personal-upload/personal_upload_component.template.dart' as personal_upload_template;
import 'register/register_component.template.dart' as register_template;
import 'search-result/search_result_component.template.dart' as search_result_template;

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

  static final homepage = RouteDefinition(
    routePath: RoutePaths.homepage,
    component: home_page_template.QuestionBankComponentNgFactory,
  );

  static final login = RouteDefinition(
    routePath: RoutePaths.login,
    component: login_template.UserComponentNgFactory,
  );
  
  static final onlineblockly = RouteDefinition(
    routePath: RoutePaths.onlineblockly,
    component: online_blockly_template.QuestionBankComponentNgFactory,
  );
  static final personalcenter = RouteDefinition(
    routePath: RoutePaths.personalcenter,
    component: personal_center_template.UserComponentNgFactory,
  );
  static final personalstore = RouteDefinition(
    routePath: RoutePaths.personalstore,
    component: personal_store_template.UserComponentNgFactory,
  );
  static final personalupload = RouteDefinition(
    routePath: RoutePaths.personalupload,
    component: personal_upload_template.UserComponentNgFactory,
  );
    static final register = RouteDefinition(
    routePath: RoutePaths.register,
    component: register_template.UserComponentNgFactory,
  );
    static final searchreault = RouteDefinition(
    routePath: RoutePaths.searchresult,
    component: search_result_template.QuestionBankComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    dashboard,
    hero,
    heroes,
    questionbank,
    question,
    homepage,
    login,
    onlineblockly,
    personalcenter,
    personalstore,
    personalupload,
    register,
    searchreault,
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.dashboard.toUrl(),
    ),
  ];
}
