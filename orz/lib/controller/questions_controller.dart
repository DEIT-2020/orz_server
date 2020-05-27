import 'package:aqueduct/aqueduct.dart';
import 'package:orz/orz.dart';
import 'package:orz/model/question.dart';


class QuestionController extends ResourceController {
  QuestionController(this.context);

  final ManagedContext context;

// //实现模糊搜索题目
//   @Operation.get()
// Future<Response> getAllQuestions({@Bind.query('qcontent') String content}) async {
//   final questionQuery = Query<Question>(context);
//   if (content != null) {
//     questionQuery.where((h) => h.qcontent).contains(content, caseSensitive: false);
//   }
//   final questions = await questionQuery.fetch();

//   return Response.ok(questions);
// }

//index,question_bank
  @Operation.get()
  Future<Response> getTopQuestions() async {
    return Response.ok("getTopQuestions");
  }

  @Operation.get('qid')
  Future<Response> getQuestionsByID(@Bind.path('qid') int id) async {
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