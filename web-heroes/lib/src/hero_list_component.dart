import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';
import 'hero.dart';
import 'hero_component.dart';
import 'hero_service.dart';

@Component(
  selector: 'my-heroes',
  templateUrl: 'hero_list_component.html',
  styleUrls: ['hero_list_component.css'],
  directives: [coreDirectives, HeroComponent],
  pipes: [commonPipes],
)
class HeroListComponent implements OnInit {
  final HeroService _heroService;
  final Router _router;
  List<Question> questions;
  Question selected;

  HeroListComponent(this._heroService, this._router);

  Future<void> _getHeroes() async {
    questions = await _heroService.getAll();
  }

  Future<void> add(String content) async {
    content = content.trim();
    if (content.isEmpty) return null;
    questions.add(await _heroService.create(content));
    selected = null;
  }

  Future<void> delete(Question question) async {
    await _heroService.delete(question.id);
    questions.remove(question);
    if (selected == question) selected = null;
  }

  void ngOnInit() => _getHeroes();

  void onSelect(Question question) => selected = question;

  String _heroUrl(int id) =>
      RoutePaths.question.toUrl(parameters: {idParam: '$id'});

  Future<NavigationResult> gotoDetail() =>
      _router.navigate(_heroUrl(selected.id));
}
