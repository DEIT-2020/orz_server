// import 'package:aqueduct/aqueduct.dart';
import 'package:heroes/heroes.dart';
import 'package:heroes/model/hero.dart';

// //version1.Controller can not handdle all the prolems, so we use ResourceController.
// class HeroesController extends Controller {
//   final _heroes = [
//     {'id': 11, 'name': 'Mr. Nice'},
//     {'id': 12, 'name': 'Narco'},
//     {'id': 13, 'name': 'Bombasto'},
//     {'id': 14, 'name': 'Celeritas'},
//     {'id': 15, 'name': 'Magneta'},    
//   ];

// @override
// Future<RequestOrResponse> handle(Request request) async {
//   if (request.path.variables.containsKey('id')) {
//     final id = int.parse(request.path.variables['id']);
//     final hero = _heroes.firstWhere((hero) => hero['id'] == id, orElse: () => null);
//     if (hero == null) {
//       return Response.notFound();
//     }

//     return Response.ok(hero);
//   }

//   return Response.ok(_heroes);
// }
// }

//version2, there is no @override in ResourceController. There are get, post, put, delete.
class HeroesController extends ResourceController {
  HeroesController(this.context);

  final ManagedContext context;  
  //固定的
  // final _heroes = [
  //   {'id': 11, 'name': 'Mr. Nice'},
  //   {'id': 12, 'name': 'Narco'},
  //   {'id': 13, 'name': 'Bombasto'},
  //   {'id': 14, 'name': 'Celeritas'},
  //   {'id': 15, 'name': 'Magneta'},
  // ];

  // @Operation.get()
  // Future<Response> getAllHeroes() async {
  //   return Response.ok(_heroes);
  // }
  
  //从数据库读入的
  // @Operation.get()
  // Future<Response> getAllHeroes() async {
  //   final heroQuery = Query<Hero>(context);//从哪个database读取，返回Hero
  //   final heroes = await heroQuery.fetch();//The fetch() execution method returns a List<Hero>.

  //   return Response.ok(heroes);
  // }
//实现模糊搜索
  @Operation.get()
Future<Response> getAllHeroes({@Bind.query('name') String name}) async {
  final heroQuery = Query<Hero>(context);
  if (name != null) {
    heroQuery.where((h) => h.name).contains(name, caseSensitive: false);
  }
  final heroes = await heroQuery.fetch();

  return Response.ok(heroes);
}

  ////version1
  // @Operation.get('id')
  // Future<Response> getHeroByID() async {
  //   final id = int.parse(request.path.variables['id']);
  //   final hero = _heroes.firstWhere((hero) => hero['id'] == id, orElse: () => null);
  //   if (hero == null) {
  //     return Response.notFound();
  //   }

  //   return Response.ok(hero);
  // }

  //version2,can tell different fault
//   @Operation.get('id')
// Future<Response> getHeroByID(@Bind.path('id') int id) async {
//   final hero = _heroes.firstWhere((hero) => hero['id'] == id, orElse: () => null);

//   if (hero == null) {
//     return Response.notFound();
//   }

//   return Response.ok(hero);
// }

  @Operation.get('id')
Future<Response> getHeroByID(@Bind.path('id') int id) async {
  final heroQuery = Query<Hero>(context)
    ..where((h) => h.id).equalTo(id);    //相当于sql的SELECT id, name FROM _question WHERE id = #;语句

  final hero = await heroQuery.fetchOne();//取一个//You can also fetch an object by its primary key with the method ManagedContext.fetchObjectWithID. 

  if (hero == null) {
    return Response.notFound();
  }
  return Response.ok(hero);
}

// @Operation.post()
// Future<Response> createHero() async {
//   final Map<String, dynamic> body = await request.body.decode();
//   final query = Query<Hero>(context)
//     ..values.name = body['name'] as String;

//   final insertedHero = await query.insert();

//   return Response.ok(insertedHero);
// }

// @Operation.post()
// Future<Response> createHero() async {
//   final hero = Hero()
//     ..read(await request.body.decode(), ignore: ["id"]);
//   final query = Query<Hero>(context)..values = hero;

//   final insertedHero = await query.insert();

//   return Response.ok(insertedHero);
// }

@Operation.post()
Future<Response> createHero(@Bind.body(ignore: ["id"]) Hero inputHero) async {
  final query = Query<Hero>(context)
    ..values = inputHero;

  final insertedHero = await query.insert();

  return Response.ok(insertedHero);
}

}