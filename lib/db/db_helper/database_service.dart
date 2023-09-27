import 'package:sqflite/sqflite.dart' as sqlite;

class DatabaseService {

  static Future<void> createTable(sqlite.Database database, String tableName, String sqlFields) async {
    await database.execute('CREATE TABLE IF NOT EXISTS $tableName ($sqlFields);');
  }

}
