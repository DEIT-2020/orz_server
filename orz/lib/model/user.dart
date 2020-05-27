import 'package:aqueduct/managed_auth.dart';
import 'package:orz/orz.dart';
import 'package:orz/model/hero.dart';

class User extends ManagedObject<_User> implements _User, ManagedAuthResourceOwner<_User> {
  @Serialize(input: true, output: false)
  String password;
}


class _User extends ResourceOwnerTableDefinition {}


