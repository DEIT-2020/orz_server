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


}