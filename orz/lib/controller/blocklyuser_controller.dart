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
  Future<Response> createUser() async {
    // final query = Query<Hero>(context)
    //   ..values = inputHero;

    // final insertedHero = await query.insert();

    // return Response.ok(insertedHero);
    Future<Response> addUser() async {
      return Response.ok("addUser");
    }
  }
}
