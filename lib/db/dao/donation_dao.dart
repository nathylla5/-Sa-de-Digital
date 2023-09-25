
import 'package:sqflite/sqflite.dart' as sqlite;

import '../../domain/donation.dart';
import '../db_helper/database_helper.dart';

class DonationDao {

  Donation donation = DonationBuilder().withLocation('Hospital X').withNumItems(30).withName('Remédio X').build();

  String dbName = 'donat';
  String tableName = 'donation';
  String sqlFields = 'name TEXT NOT NULL, location TEXT NOT NULL, numItems INTEGER NOT NULL';

  Future<List<Donation>> findAll() async {
    DatabaseHelper dbHelper = DatabaseHelper(dbName: dbName, tableName: tableName, sqlFields: sqlFields);
    sqlite.Database database = await dbHelper.initialize();
    database.insert(tableName, donation.toJson());

    String sql = 'SELECT * FROM donation;';
    final resultSet = await database.rawQuery(sql);
    print('teste resultset $resultSet');

    List<Donation> list = [];
    for (var json in resultSet) {
      var newDonation = Donation.fromJson(json);
      list.add(newDonation);
    }

    return list;
  }
}
