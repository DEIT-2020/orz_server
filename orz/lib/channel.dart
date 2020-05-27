import 'orz.dart';
import 'controller/heroes_controller.dart';
import 'package:aqueduct/managed_auth.dart';
import 'package:orz/model/user.dart';
import 'package:orz/controller/register_controller.dart';


class HeroesChannel extends ApplicationChannel {

//ManagedDataModel.fromCurrentMirrorSystem() will find all of our ManagedObject<T> subclasses and 'compile' them into a data model. 
  ManagedContext context;
 // Add this field
  AuthServer authServer;


  //version3
  @override
Future prepare() async {
  logger.onRecord.listen(
      (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

  final config = HeroConfig(options.configurationFilePath);
  final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
  final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
      config.database.username,
      config.database.password,
      config.database.host,
      config.database.port,
      config.database.databaseName);

  context = ManagedContext(dataModel, persistentStore);
  // Add these two lines:
    final authStorage = ManagedAuthDelegate<User>(context);
    authServer = AuthServer(authStorage);
}

//version2
  // @override
  // Future prepare() async {
  //   logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

  //   final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
  //   final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
  //     "heroes_user", "password", "localhost", 5432, "heroes");

  //   context = ManagedContext(dataModel, persistentStore);
  // }
//version1
  // @override
  // Future prepare() async {
  //   logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  // }


  @override
  Controller get entryPoint {
    final router = Router();

    // add this route
  router
    .route('/auth/token')
    .link(() => AuthController(authServer));

    router
    .route('/heroes/[:id]')
    // .link(() => Authorizer.bearer(authServer))
    .link(() => HeroesController(context));

    
    router
      .route("/example")
      .linkFunction((request) async {
        return Response.ok({"key": "value"});
      });

    router
      .route('/register')
      .link(() => RegisterController(context, authServer));

    return router;
  }
}
//导入config
class HeroConfig extends Configuration {
  HeroConfig(String path): super.fromFile(File(path));

  DatabaseConfiguration database;
}
