import 'package:aqueduct/aqueduct.dart';
import 'package:orz_server/orz_server.dart';
import 'package:orz_server/model/hero.dart';



//login,personal_center
class AdministerController extends ResourceController {
  AdministerController(this.context);

  final ManagedContext context;
  @Operation.get()
  Future<Response> getAdminister() async {
    return Response.ok("getAdminister");
  }

  @Operation.post()
  Future<Response> createAdminister() async {
    // final query = Query<Hero>(context)
    //   ..values = inputHero;

    // final insertedHero = await query.insert();

    // return Response.ok(insertedHero);
    Future<Response> addAdminister() async {
      return Response.ok("addAdminister");
    }
  }
}