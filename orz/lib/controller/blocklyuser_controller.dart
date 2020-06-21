import 'package:aqueduct/aqueduct.dart';
import 'package:orz/orz.dart';
import 'package:orz/model/blocklyuser.dart';



//login,personal_center
class UserController extends ResourceController {
  UserController(this.context);

  final ManagedContext context;

@Operation.get('id')
  Future<Response> getUserByID(@Bind.path('id') int id) async {
  final userQuery = Query<Blocklyuser>(context)
    ..where((u) => u.id).equalTo(id);    //相当于sql的SELECT id, name FROM _question WHERE id = #;语句

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
  
  @Operation.put('id')
Future<Response> updateUser(@Bind.path('id') int id, @Bind.body() Blocklyuser user) async {
  final query = Query<Blocklyuser>(context)
    ..where((u) => u.id).equalTo(id)
    ..values = user;

  return Response.ok(await query.updateOne());
}

  
}
