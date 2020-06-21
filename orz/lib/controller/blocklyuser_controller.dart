import 'package:aqueduct/aqueduct.dart';
import 'package:orz/orz.dart';
import 'package:orz/model/blocklyuser.dart';



//login,personal_center
class UserController extends ResourceController {
  UserController(this.context);

  final ManagedContext context;
  @Operation.get('user_id')
  Future<Response> getUser() async {
    return Response.ok("getUser");
  }


      @Operation.post()
  Future<Response> storeUser(@Bind.body() Blocklyuser inputUser) async {
    final postquery = Query<Blocklyuser>(context)
  ..values = inputUser;
    final insertedUser = await postquery.insert();

    return Response.ok(insertedUser);
  }


}
