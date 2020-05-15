import 'package:aqueduct/aqueduct.dart';
import 'package:orz_server/orz_server.dart';
import 'package:orz_server/model/hero.dart';
class HeroesController extends ResourceController {
  
  HeroesController(this.context);

  final ManagedContext context;

//hero_initial
  @Operation.get()
  Future<Response> getAllHeroes() async {
    final heroQuery = Query<Hero>(context);
    final heroes = await heroQuery.fetch();

    return Response.ok(heroes);
  }

  @Operation.get('id')
  Future<Response> getHeroByID(@Bind.path('id') int id) async {
    final heroQuery = Query<Hero>(context)..where((h) => h.id).equalTo(id);

    final hero = await heroQuery.fetchOne();

    if (hero == null) {
      return Response.notFound();
    }
    return Response.ok(hero);
  }
//

}

class QuestionController extends ResourceController {
  
  QuestionController(this.context);

  final ManagedContext context;

//index,question_bank
  @Operation.get()
  Future<Response> getTopQuestions() async {
    return Response.ok("getTopQuestions");
  }

  @Operation.get('id')
  Future<Response> getQuestionsByID(@Bind.path('id') int id) async {
    return Response.ok("getQuestionsByID");
  }



}
