import 'orz_server.dart';
import 'controller/orz_controller.dart';
/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class HeroesChannel extends ApplicationChannel {
  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
 ManagedContext context;
  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
    final config = HeroConfig(options.configurationFilePath);
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
     final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
      config.database.username,
      config.database.password,
      config.database.host,
      config.database.port,
      config.database.databaseName);


    context = ManagedContext(dataModel, persistentStore);
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();

    // Prefer to use `link` instead of `linkFunction`.
    // See: https://aqueduct.io/docs/http/request_controller/


    // router
    //   .route("/example")
    //   .linkFunction((request) async {
    //     return Response.ok({"key": "value"});
    //   });
    // router
    //   .route('/heroes')
    //   .link(() => HeroesController(context));
    
    router
      .route("/index")
      .link(() => QuestionController(context));

    router
      .route("/online_blockly")
      .linkFunction((request) async {
        return Response.ok({"key": "online_blockly"});
      });

    
  //question bank
    router
    .route("/question_bank")
    .link(() => QuestionController(context));

    router
    .route("/question_bank_detail/[:id]")
    .link(() => QuestionController(context));
     

    router
    .route("/search_result")
    .linkFunction((request) async {
        return Response.ok({"key": "/search_result"});
      });

//personal
    router
    .route("/personal_center/[:id]")
    .linkFunction((request) async {
        return Response.ok({"key": "/personal_center/[:id]"});
      });
    router
    .route("/personal_center_upload/[:id]")
    .linkFunction((request) async {
        return Response.ok({"key": "/personal_center_upload/[:id]"});
      });

    router
    .route("/personal_center_store/[:id]")
    .linkFunction((request) async {
        return Response.ok({"key": "/personal_center_store/[:id]"});
      });

//administer
    router
    .route("/administer_personal_center/[:id]")
    .linkFunction((request) async {
        return Response.ok({"key": "/administer_personal_center/[:id]"});
      });

    router
    .route("/administer_user_information/[:id]")
    .linkFunction((request) async {
        return Response.ok({"key": "/administer_user_information/[:id]"});
      });

    router
    .route("/administer_question_update/[:id]")
    .linkFunction((request) async {
        return Response.ok({"key": "/administer_question_update/[:id]"});
      });

  router
    .route("/administer_question_check/[:id]")
    .linkFunction((request) async {
        return Response.ok({"key": "/administer_question_check/[:id]"});
      });

router
    .route("/administer_feedback/[:id]")
    .linkFunction((request) async {
        return Response.ok({"key": "/administer_feedback/[:id]"});
      });

      
    return router;
  }
}

class HeroConfig extends Configuration {
  HeroConfig(String path): super.fromFile(File(path));

  DatabaseConfiguration database;
}