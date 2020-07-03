import 'package:aqueduct/aqueduct.dart';
import 'package:orz/orz.dart';
import 'package:orz/model/blocklyuser.dart';
import 'package:orz/model/question.dart';


//login,personal_center
class UserstoreController extends ResourceController {
  UserstoreController(this.context);

  final ManagedContext context;

@Operation.get('uid')
  Future<Response> getUserstoreByID(@Bind.path('uid') int uid) async {
  final userQuery = Query<UserStore>(context)
    ..where((u) => u.user.id).equalTo(uid);    //相当于sql的SELECT id, name FROM _question WHERE id = #;语句
   
  final user = await userQuery.fetch();//取一个//You can also fetch an object by its primary key with the method ManagedContext.fetchObjectWithID. 

  if (user == null) {
    return Response.notFound();
  }
  else{
    return Response.ok(user);
    }
  }

   @Operation.post('uid','qid')
  Future<Response> storeUserstore(@Bind.path('uid') int uid,@Bind.path('qid') int qid) async {
    final postquery = Query<UserStore>(context)
  ..values.storetime= DateTime.now()
  ..values.user.id = uid
  ..values.question.id  = qid;
    final insertedUserfinish = await postquery.insert();

    return Response.ok(insertedUserfinish);
  }

  //delete
  @Operation.delete()
  Future<Response> deleteUserstore(@Bind.body() UserStore userstore) async {
  final deletequery = Query<UserStore>(context)
    ..where((us) => us.id).equalTo(userstore.id);
  await deletequery.delete();
    return Response.ok("删除成功！");
  }
  }
