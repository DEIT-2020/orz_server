import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration7 extends Migration { 
  @override
  Future upgrade() async {
   		database.deleteTable("_Question");
		database.deleteTable("_Type");
		database.deleteTable("_Blocklyuser");
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {}
}
    