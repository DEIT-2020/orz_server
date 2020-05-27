import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration4 extends Migration { 
  @override
  Future upgrade() async {
   		database.createTable(SchemaTable("_QuestionType", [SchemaColumn("id", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false)]));
		database.createTable(SchemaTable("_Type", [SchemaColumn("tid", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("tname", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false)]));
		database.createTable(SchemaTable("_UserFinish", [SchemaColumn("id", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("correct", ManagedPropertyType.integer, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("finishtime", ManagedPropertyType.datetime, isPrimaryKey: false, autoincrement: false, isIndexed: true, isNullable: false, isUnique: false)]));
		database.createTable(SchemaTable("_UserStore", [SchemaColumn("id", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("storetime", ManagedPropertyType.datetime, isPrimaryKey: false, autoincrement: false, isIndexed: true, isNullable: false, isUnique: false)]));
		database.createTable(SchemaTable("_Blocklyuser", [SchemaColumn("id", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("uname", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: true),SchemaColumn("uemail", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: true),SchemaColumn("uphone", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: true),SchemaColumn("upassword", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false)]));
		database.addColumn("_QuestionType", SchemaColumn.relationship("question", ManagedPropertyType.bigInteger, relatedTableName: "_Question", relatedColumnName: "id", rule: DeleteRule.nullify, isNullable: true, isUnique: false));
		database.addColumn("_QuestionType", SchemaColumn.relationship("type", ManagedPropertyType.bigInteger, relatedTableName: "_Type", relatedColumnName: "tid", rule: DeleteRule.nullify, isNullable: true, isUnique: false));
		database.addColumn("_UserFinish", SchemaColumn.relationship("user", ManagedPropertyType.bigInteger, relatedTableName: "_Blocklyuser", relatedColumnName: "id", rule: DeleteRule.nullify, isNullable: true, isUnique: false));
		database.addColumn("_UserFinish", SchemaColumn.relationship("question", ManagedPropertyType.bigInteger, relatedTableName: "_Question", relatedColumnName: "id", rule: DeleteRule.nullify, isNullable: true, isUnique: false));
		database.addColumn("_UserStore", SchemaColumn.relationship("user", ManagedPropertyType.bigInteger, relatedTableName: "_Blocklyuser", relatedColumnName: "id", rule: DeleteRule.nullify, isNullable: true, isUnique: false));
		database.addColumn("_UserStore", SchemaColumn.relationship("question", ManagedPropertyType.bigInteger, relatedTableName: "_Question", relatedColumnName: "id", rule: DeleteRule.nullify, isNullable: true, isUnique: false));
		database.addColumn("_Question", SchemaColumn("id", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false));
		database.deleteColumn("_Question", "qid");
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {}
}
    