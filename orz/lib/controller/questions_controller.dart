import 'package:aqueduct/aqueduct.dart';
import 'package:orz/orz.dart';
import 'package:orz/model/question.dart';
import 'package:orz/model/blocklyuser.dart';

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
  Future<Response> getQuestions() async {
    final questionQuery = Query<Question>(context);//从哪个database读取
    final questions = await questionQuery.fetch();//The fetch() execution method returns a List<Hero>.

    return Response.ok(questions);
  }

  @Operation.get('qid')
  Future<Response> getQuestionsByID(@Bind.path('qid') int qid) async {
  final questionQuery = Query<Question>(context)
    ..where((q) => q.id).equalTo(qid);    //相当于sql的SELECT id, name FROM _question WHERE id = #;语句

  final question = await questionQuery.fetchOne();//取一个//You can also fetch an object by its primary key with the method ManagedContext.fetchObjectWithID. 
  if (question == null) {
    return Response.notFound();
  }
  else{
    return Response.ok(question);
    }
  }

  //实现模糊搜索

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

    @Operation.put('qid')
Future<Response> updateUser(@Bind.path('qid') int qid, @Bind.body() Question question) async {
  final query = Query<Question>(context)
    ..where((u) => u.id).equalTo(qid)
    ..values = question;

  return Response.ok(await query.updateOne());
}
//delete
  @Operation.delete()
  Future<Response> deleteQuestion(@Bind.body() Question question) async {
  final deletequery = Query<Question>(context)
    ..where((q) => q.id).equalTo(question.id);
  await deletequery.delete();
    return Response.ok("删除成功！");
  }


  @Operation.post('qid')
  Future<Response> storeUserstore(@Bind.path('qid') int qid,@Bind.body() Blocklyuser blocklyuser) async {
    final postquery = Query<UserStore>(context)
  ..values.storetime= DateTime.now()
  ..values.user.id = blocklyuser.id
  ..values.question.id  = qid;
    final insertedUserstore = await postquery.insert();

    return Response.ok(insertedUserstore);
  }

  
}