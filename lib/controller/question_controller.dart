import 'package:aqueduct/aqueduct.dart';
import 'package:orz_server/orz_server.dart';
import 'package:orz_server/model/hero.dart';


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
