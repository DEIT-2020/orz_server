import 'package:aqueduct/aqueduct.dart';
import 'package:orz/orz.dart';
import 'package:orz/model/blocklyuser.dart';
import 'package:orz/model/question.dart';


//login,personal_center
class UserController extends ResourceController {
  UserController(this.context);

  final ManagedContext context;


//unfinished
  @Operation.post('id','qid')
  Future<Response> storeUserstore(@Bind.path('id') int id,@Bind.path('qid') int qid) async {
    final postquery = Query<UserStore>(context)
  ..values.id = id
  ..values.id = qid;
    final insertedUserstore = await postquery.insert();

    return Response.ok(insertedUserstore);
  }

@Operation.get('id','qid')
  Future<Response> getUserstore(@Bind.path('id') int id,@Bind.path('qid') int qid) async {
  final userstoreQuery = Query<UserStore>(context)
    ..where((u) => u.id).equalTo(id);    //相当于sql的SELECT id, name FROM _question WHERE id = #;语句

  final userstore = await userstoreQuery.fetch();//取一个//You can also fetch an object by its primary key with the method ManagedContext.fetchObjectWithID. 

  if (userstore == null) {
    return Response.notFound();
  }
  else{
    return Response.ok(userstore);
    }
  }
}
