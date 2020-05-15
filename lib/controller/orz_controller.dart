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
//search
  @Operation.get('keyword')
  Future<Response> getQuestions() async {
    return Response.ok("getQuestions");
  }
//upload
  @Operation.get('QuestionContent')
  Future<Response> uploadQuestions() async {
    return Response.ok("uploadQuestions");
  }
//store
  @Operation.post()
  Future<Response> storeQuestions() async {
    return Response.ok("storeQuestions");
  }
//check
  @Operation.put('QuestionID')
  Future<Response> checkQuestions() async {
    return Response.ok("checkQuestions");
  }
}

//login,personal_center
class UserController extends ResourceController {
  UserController(this.context);

  final ManagedContext context;
  @Operation.get()
  Future<Response> getUser() async {
    return Response.ok("getUser");
  }

  @Operation.post()
  Future<Response> createUser() async {
    // final query = Query<Hero>(context)
    //   ..values = inputHero;

    // final insertedHero = await query.insert();

    // return Response.ok(insertedHero);
    Future<Response> addUser() async {
      return Response.ok("addUser");
    }
  }
}

//login,personal_center
class AdministerController extends ResourceController {
  AdministerController(this.context);

  final ManagedContext context;
  @Operation.get()
  Future<Response> getAdminister() async {
    return Response.ok("getAdminister");
  }

  @Operation.post()
  Future<Response> createAdminister() async {
    // final query = Query<Hero>(context)
    //   ..values = inputHero;

    // final insertedHero = await query.insert();

    // return Response.ok(insertedHero);
    Future<Response> addAdminister() async {
      return Response.ok("addAdminister");
    }
  }
}