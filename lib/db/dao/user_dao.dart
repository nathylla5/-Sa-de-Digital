import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

import '../../domain/user.dart';
import '../db_helper/database_helper.dart';
import '../db_helper/database_service.dart';

class UserDao {
  final _baseUrl = 'https://saude-digital-14b47-default-rtdb.firebaseio.com';

  User userNull = UserBuilder()
      .withName('')
      .withImage('')
      .withDate('')
      .withUsername('')
      .withEmail('')
      .withDiseases('').build();

  User user = UserBuilder()
      .withID('12')
      .withName('Tarsis Marinho')
      .withUsername('@tarsis_marinheiro')
      .withDate('10/10/1982')
      .withPassword('145')
      .withImage('assets/tarsis_sleepando.jpeg')
      .withEmail('tarsis@ifal.edu.br')
      .withDiseases('Hipertensão - Diabetes').build();

  Future<void> insertUser(User user) async {
    await http.post(Uri.parse('$_baseUrl/user.json'),
        body: jsonEncode({
          'id': user.id,
          'name': user.name,
          'email': user.email,
          'birthDate': user.birthDate,
          'password': user.password,
          'urlImage': user.urlImage,
        }));
  }

  Future<User> getInfoProfile(String username, String email) async {

    print('teste user ${user.toJson()}');

    String dbName = 'us';
    String tableName = 'user';
    String sqlFields = 'id TEXT NOT NULL PRIMARY KEY, name TEXT NOT NULL, username TEXT NOT NULL, birthDate TEXT NOT NULL, password TEXT NOT NULL, urlImage TEXT NOT NULL, email TEXT NOT NULL, diseases TEXT NOT NULL';
    DatabaseHelper dbHelper = DatabaseHelper(dbName: dbName, tableName: tableName, sqlFields: sqlFields);
    Database database = await dbHelper.initialize();
    database.insert(tableName, user.toJson());

    String sql =
        'SELECT * FROM user '
        'WHERE email = ? and username = ?;';

    final resultSet = await database.rawQuery(sql, [email, username]);
    print('teste resultset ${resultSet}');

    sql =
        'SELECT * FROM user;';

    final result = await database.rawQuery(sql);
    print('teste resultset ${result}');

    for (var json in resultSet) {
      user = User.fromJson(json);
    }

    print('testefromjson  ${user.toJson()}');
    return user;
  }

}
