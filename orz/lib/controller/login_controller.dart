import 'package:aqueduct/aqueduct.dart';
import 'package:orz/orz.dart';
import 'package:orz/model/question.dart';
import 'package:orz/model/blocklyuser.dart';

class LoginController extends ResourceController {
  LoginController(this.context);

  final ManagedContext context;

@Operation.get('uphone')
  Future<Response> getUserByID(@Bind.path('uphone') String uphone) async {
  final userQuery = Query<Blocklyuser>(context)
    ..where((u) => u.uphone).equalTo(uphone);    //相当于sql的SELECT id, name FROM _question WHERE id = #;语句
   
  final user = await userQuery.fetchOne();//取一个//You can also fetch an object by its primary key with the method ManagedContext.fetchObjectWithID. 

  if (user == null) {
    return Response.notFound();
  }
  else{
    return Response.ok(user);
    }
  }


}