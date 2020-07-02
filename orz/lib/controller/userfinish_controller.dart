import 'package:aqueduct/aqueduct.dart';
import 'package:orz/orz.dart';
import 'package:orz/model/blocklyuser.dart';
import 'package:orz/model/question.dart';


//login,personal_center
class UserfinishController extends ResourceController {
  UserfinishController(this.context);

  final ManagedContext context;

@Operation.get('uid')
  Future<Response> getUserByID(@Bind.path('uid') int uid) async {
  final userQuery = Query<UserFinish>(context)
    ..where((u) => u.user.id).equalTo(uid);    //相当于sql的SELECT id, name FROM _question WHERE id = #;语句
   
  final user = await userQuery.fetch();//取一个//You can also fetch an object by its primary key with the method ManagedContext.fetchObjectWithID. 

  if (user == null) {
    return Response.notFound();
  }
  else{
    return Response.ok(user);
    }
  }

   @Operation.post('uid','qid','correct')
  Future<Response> storeUserfinish(@Bind.path('uid') int uid,@Bind.path('qid') int qid,@Bind.path('correct') int correct) async {
    final postquery = Query<UserFinish>(context)
  ..values.finishtime= DateTime.now()
  ..values.correct=correct
  ..values.user.id = uid
  ..values.question.id  = qid;
    final insertedUserfinish = await postquery.insert();

    return Response.ok(insertedUserfinish);
  }

  //delete
  @Operation.delete("uid")
  Future<Response> deleteQuestion(@Bind.path('uid') int uid,@Bind.body() UserFinish userfinish) async {
  final deletequery = Query<UserFinish>(context)
    ..where((uf) => uf.id).equalTo(userfinish.id);
  await deletequery.delete();
    return Response.ok("删除成功！");
  }
  }
