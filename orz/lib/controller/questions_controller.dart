import 'package:aqueduct/aqueduct.dart';
import 'package:orz/orz.dart';
import 'package:orz/model/question.dart';


class QuestionController extends ResourceController {
  QuestionController(this.context);

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
  Future<Response> getTopQuestions() async {
    final questionQuery = Query<Question>(context);//从哪个database读取
    final questions = await questionQuery.fetch();//The fetch() execution method returns a List<Hero>.

    return Response.ok(questions);
  }

  // @Operation.get('qid')
  // Future<Response> getQuestionsByID(@Bind.path('qid') int id) async {
  //   return Response.ok("getQuestionsByID");
  // }
// //search
  // @Operation.get()
  // Future<Response> getQuestions() async {
  //   return Response.ok("getQuestions");
  // }

// //store
//   // @Operation.post()
//   // Future<Response> storeQuestion() async {
//   //   final postquery = Query<Question>(context)
//   //   ..values.qid=15
//   // ..values.qcontent = "1+1=?"
//   // ..values.qanswer = "2"
//   // ..values.qsource='test';  

//   // final insertedQuestion =await postquery.insert();  
//   // return Response.ok(insertedQuestion);
//   // }

    @Operation.post()
  Future<Response> storeQuestion(@Bind.body() Question inputQuestion) async {
    final postquery = Query<Question>(context)
  ..values = inputQuestion;
    final insertedQuestion = await postquery.insert();

    return Response.ok(insertedQuestion);
  }

// //check
//   @Operation.put('QuestionID')
//   Future<Response> checkQuestions() async {
//     return Response.ok("checkQuestions");
//   }

//delete
  @Operation.delete()
  Future<Response> deleteQuestion(@Bind.body() Question inputQuestion) async {
  final deletequery = Query<Question>(context)
    ..where((q) => q.id).equalTo(inputQuestion.id);
  await deletequery.delete();
    return Response.ok("删除成功！");
  }
}