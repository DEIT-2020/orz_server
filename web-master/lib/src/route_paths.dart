import 'package:angular_router/angular_router.dart';

const idParam = 'id';

class RoutePaths {
  static final dashboard = RoutePath(path: 'dashboard');
  static final heroes = RoutePath(path: 'heroes');
  static final hero = RoutePath(path: '${heroes.path}/:$idParam');
  static final questionbank = RoutePath(path: 'question-bank');
 static final question = RoutePath(path: '${questionbank.path}/:$idParam');
   static final homepage = RoutePath(path: 'home-page');
   static final login = RoutePath(path: 'login');
}

int getId(Map<String, String> parameters) {
  final id = parameters[idParam];
  return id == null ? null : int.tryParse(id);
}
