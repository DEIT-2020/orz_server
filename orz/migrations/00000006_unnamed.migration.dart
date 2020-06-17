import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration6 extends Migration { 
  @override
  Future upgrade() async {
   		database.deleteTable("_QuestionType");
		database.deleteTable("_UserFinish");
		database.deleteTable("_UserStore");
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {}
}
    