import 'package:aqueduct/aqueduct.dart';
import 'package:orz/orz.dart';
import 'package:orz/model/question.dart';
import 'package:orz/model/user.dart';

class SearchController extends ResourceController {
  SearchController(this.context);

  final ManagedContext context;
//   @Operation.get()
// Future<Response> getAllHeroes({@Bind.query('name') String name}) async {
//   final heroQuery = Query<Hero>(context);
//   if (name != null) {
//     heroQuery.where((h) => h.name).contains(name, caseSensitive: false);
//   }
//   final heroes = await heroQuery.fetch();

//   return Response.ok(heroes);
// }
 
    @Operation.get()
  Future<Response> searchtQuestions({@Bind.query('name') String name}) async {
  final questionQuery = Query<Question>(context);
  if (name != null) {
    questionQuery.where((q) => q.qcontent).contains(name, caseSensitive: false);
  }
  final question = await questionQuery.fetch();

    if (question == null) {
    return Response.notFound();
  }
  else{
    return Response.ok(question);
    }
  }

 }