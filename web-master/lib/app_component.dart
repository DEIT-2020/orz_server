import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'src/routes.dart';
import 'src/service/hero_service.dart';

@Component(
  selector: 'my-app',
  template: '''
    <h1>{{title}}</h1>
    <nav>
      <a [routerLink]="RoutePaths.dashboard.toUrl()"
         [routerLinkActive]="'active'">Dashboard</a>
      <a [routerLink]="RoutePaths.heroes.toUrl()"
         [routerLinkActive]="'active'">Heroes</a>
         <a [routerLink]="RoutePaths.questionbank.toUrl()"
         [routerLinkActive]="'active'">Questions</a>
      <a [routerLink]="RoutePaths.homepage.toUrl()"
         [routerLinkActive]="'active'">homepage</a>
      <a [routerLink]="RoutePaths.login.toUrl()"
         [routerLinkActive]="'active'">login</a>
         <a [routerLink]="RoutePaths.onlineblockly.toUrl()"
         [routerLinkActive]="'active'">onloneblockly</a>
         <a [routerLink]="RoutePaths.personalcenter.toUrl()"
         [routerLinkActive]="'active'">personalcenter</a>
         <a [routerLink]="RoutePaths.personalstore.toUrl()"
         [routerLinkActive]="'active'">personalstore</a>
         <a [routerLink]="RoutePaths.personalupload.toUrl()"
         [routerLinkActive]="'active'">personalupload</a>
         <a [routerLink]="RoutePaths.register.toUrl()"
         [routerLinkActive]="'active'">register</a>
         <a [routerLink]="RoutePaths.searchresult.toUrl()"
         [routerLinkActive]="'active'">searchresult</a>
    </nav>
    <router-outlet [routes]="Routes.all"></router-outlet>
  ''',
  styleUrls: ['app_component.css'],
  directives: [routerDirectives],
  providers: [ClassProvider(HeroService)],
  exports: [RoutePaths, Routes],
)
class AppComponent {
  final title = 'Tour of Heroes';
}
