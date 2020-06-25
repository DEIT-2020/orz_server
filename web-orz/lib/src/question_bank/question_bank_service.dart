import 'dart:async';

import 'package:angular/core.dart';

/// Mock service emulating access to a to-do list stored on a server.
@Injectable()
class QuestionBankService {
  List<String> mockType = <String>['123','4'];

  Future<List<String>> getType() async => mockType;
}
