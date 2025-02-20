import 'orz.dart';
import 'controller/heroes_controller.dart';
import 'package:aqueduct/managed_auth.dart';
import 'package:orz/model/user.dart';
import 'package:orz/controller/register_controller.dart';
import 'package:orz/controller/questions_controller.dart';
import 'package:orz/controller/search_controller.dart';
import 'package:orz/controller/blocklyuser_controller.dart';
import 'package:orz/controller/type_controller.dart';
import 'package:orz/controller/login_controller.dart';
import 'package:orz/controller/userfinish_controller.dart';
import 'package:orz/controller/userstore_controller.dart';

class HeroesChannel extends ApplicationChannel {

//ManagedDataModel.fromCurrentMirrorSystem() will find all of our ManagedObject<T> subclasses and 'compile' them into a data model. 
  ManagedContext context;
 // Add this field
  AuthServer authServer;
  
//////hhhhhhhhhh///////////////////

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
  //CORSPolicy.defaultPolicy.allowedOrigins = ["127.0.0.1:8080"];
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

  //   // add this route
  // router
  //   .route('/auth/token')
  //   .link(() => AuthController(authServer));

    // router
    // .route('/heroes/[:id]')
    // // .link(() => Authorizer.bearer(authServer))
    // .link(() => HeroesController(context));

    
    // router
    //   .route("/example")
    //   .linkFunction((request) async {
    //     return Response.ok({"key": "value"});
    //   });

    // router
    //   .route('/register')
    //   .link(() => RegisterController(context, authServer));


// //index
//     router
//         .route("/index")
//         .link(() => QuestionController(context));
// //login
//     router
//         .route("/login/custom")
//         .link(() => UserController(context));
//     router
//         .route("/login/administer")
//         .link(() => UserController(context));

// //online_blockly
//     router
//         .route("/online_blockly")
//         .linkFunction((request) async {
//       return Response.ok({"key": "online_blockly"});
//     });

//type
    router
        .route("/type/[:id]")
        .link(() =>TypeController(context));

    //question bank
    router
        .route("/question_bank/[:qid]")
        .link(() => QuestionController(context));

    router
        .route("/search")
        .link(() => SearchController(context));
    //     .linkFunction((request) async {
    //   return Response.ok({"key": "/search_result"});
    // });

//personal
    router
        .route("/personal_center/[:uid/[:qid]]")
        .link(() => UserController(context));
    //     .linkFunction((request) async {
    //   return Response.ok({"key": "/personal_center/[:id]"});
    // });
    
//personal
    router
        .route("/login/[:uphone]")
        .link(() => LoginController(context));

    router
        .route("/personal_center_store/[:id]")
        .link(() => QuestionController(context));//Not Sure Really
    //     .linkFunction((request) async {
    //   return Response.ok({"key": "/personal_center_store/[:id]"});
    // });
  router
        .route("/userfinish/[:uid/[:qid/[:correct]]]")
        .link(() => UserfinishController(context));
  router
        .route("/userstore/[:uid/[:qid]]")
        .link(() => UserstoreController(context));
    
//test
    //  router
    //     .route("/test")
    //     .linkFunction((request) async {
    //   return Response.ok(["name1","name2","name3"]);
    // });

// //administer
//     router
//         .route("/administer_personal_center/[:id]")
//         .link(() => AdministerController(context));
//     //     .linkFunction((request) async {
//     //   return Response.ok({"key": "/administer_personal_center/[:id]"});
//     // });

//     router
//         .route("/administer_user_information/[:id]")
//         .link(() => UserController(context));
//     //     .linkFunction((request) async {
//     //   return Response.ok({"key": "/administer_user_information/[:id]"});
//     // });

//     router
//         .route("/administer_question_update/[:id]")
//         .link(() => QuestionController(context));
//     //     .linkFunction((request) async {
//     //   return Response.ok({"key": "/administer_question_update/[:id]"});
//     // });

//     router
//         .route("/administer_question_check/[:id]")
//         .link(() => QuestionController(context));
//     //     .linkFunction((request) async {
//     //   return Response.ok({"key": "/administer_question_check/[:id]"});
//     // });

//     // router
//     //     .route("/administer_feedback/[:id]")
//     //     .linkFunction((request) async {
//     //   return Response.ok({"key": "/administer_feedback/[:id]"});
//     // });



    return router;

  }
}
//导入config
class HeroConfig extends Configuration {
  HeroConfig(String path): super.fromFile(File(path));

  DatabaseConfiguration database;
}
