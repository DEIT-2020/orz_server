import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:stream_transform/stream_transform.dart';

import 'route_paths.dart';
import 'hero_search_service.dart';
import 'hero.dart';

@Component(
  selector: 'hero-search',
  templateUrl: 'hero_search_component.html',
  styleUrls: ['hero_search_component.css'],
  directives: [coreDirectives],
  providers: [ClassProvider(HeroSearchService)],
  pipes: [commonPipes],
)
class HeroSearchComponent implements OnInit {
  HeroSearchService _heroSearchService;
  Router _router;

  Stream<List<Question>> questions;
  StreamController<String> _searchTerms = StreamController<String>.broadcast();

  HeroSearchComponent(this._heroSearchService, this._router) {}



  void search(String term) => _searchTerms.add(term);

  void ngOnInit() async {
    questions = _searchTerms.stream
        .transform(debounce(Duration(milliseconds: 300)))
        .distinct()
        .transform(switchMap((term) => term.isEmpty
            ? Stream<List<Question>>.fromIterable([<Question>[]])
            : _heroSearchService.search(term).asStream()))
        .handleError((e) {
      print(e); // for demo purposes only
    });
  }

  String _heroUrl(int id) =>
      RoutePaths.question.toUrl(parameters: {idParam: '$id'});

  Future<NavigationResult> gotoDetail(Question question) =>
      _router.navigate(_heroUrl(question.id));
}
