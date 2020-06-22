import 'package:aqueduct/aqueduct.dart';
import 'package:orz/orz.dart';
import 'package:orz/model/blocklyuser.dart';
import 'package:orz/model/question.dart';


//login,personal_center
class UserController extends ResourceController {
  UserController(this.context);

  final ManagedContext context;

@Operation.get('uid')
  Future<Response> getUserByID(@Bind.path('uid') int uid) async {
  final userQuery = Query<Blocklyuser>(context)
    ..where((u) => u.id).equalTo(uid);    //相当于sql的SELECT id, name FROM _question WHERE id = #;语句

  final user = await userQuery.fetchOne();//取一个//You can also fetch an object by its primary key with the method ManagedContext.fetchObjectWithID. 

  if (user == null) {
    return Response.notFound();
  }
  else{
    return Response.ok(user);
    }
  }


  @Operation.post()
  Future<Response> storeUser(@Bind.body() Blocklyuser inputUser) async {
    final postquery = Query<Blocklyuser>(context)
  ..values = inputUser;
    final insertedUser = await postquery.insert();

    return Response.ok(insertedUser);
  }
  
  @Operation.put('uid')
Future<Response> updateUser(@Bind.path('uid') int uid, @Bind.body() Blocklyuser user) async {
  final query = Query<Blocklyuser>(context)
    ..where((u) => u.id).equalTo(uid)
    ..values = user;

  return Response.ok(await query.updateOne());
}


  @Operation.get('uid','qid')
  Future<Response> storeUserstore(@Bind.path('uid') int uid,@Bind.path('qid') int qid) async {
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
  }
