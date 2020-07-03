import 'package:aqueduct/aqueduct.dart';
import 'package:orz/orz.dart';
import 'package:orz/model/question.dart';
import 'package:orz/model/blocklyuser.dart';

class TypeController extends ResourceController {
  TypeController(this.context);

  final ManagedContext context;

// // //实现模糊搜索题目
// //   @Operation.get()
// // Future<Response> getAllQuestions({@Bind.query('qcontent') String content}) async {
// //   final questionQuery = Query<Question>(context);
// //   if (content != null) {
// //     questionQuery.where((h) => h.qcontent).contains(content, caseSensitive: false);
// //   }
// //   final questions = await questionQuery.fetch();

// //   return Response.ok(questions);
// // }

//index,question_bank
  @Operation.get()
  Future<Response> getTypes() async {
    final typeQuery = Query<Type>(context);//从哪个database读取
    final types = await typeQuery.fetch();//The fetch() execution method returns a List<Hero>.

    return Response.ok(types);
  }

    @Operation.post()
  Future<Response> storeQuestion(@Bind.body() Type inputType) async {
    final postquery = Query<Type>(context)
  ..values = inputType;
    final insertedQuestion = await postquery.insert();

    return Response.ok(insertedQuestion);
  }
    @Operation.put('id')
Future<Response> updateUser(@Bind.path('id') int id, @Bind.body() Type type) async {
  final query = Query<Type>(context)
    ..where((t) => t.id).equalTo(id)
    ..values = type;

  return Response.ok(await query.updateOne());
}
//delete
  @Operation.delete()
  Future<Response> deleteQuestion(@Bind.body() Type type) async {
  final deletequery = Query<Type>(context)
    ..where((t) => t.id).equalTo(type.id);
  await deletequery.delete();
    return Response.ok("删除成功！");
  }
}