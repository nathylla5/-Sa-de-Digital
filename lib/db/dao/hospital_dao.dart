import 'dart:async';
import 'package:flutter_application_2/db/db_helper/database_service.dart';

import '../../domain/hospital.dart';
import '../db_helper/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class HospitalDao {
  Hospital hospital = Hospital(nome: "HE", descricao: "Hospital de Emergência", id: 1, qtdEstrelas: 5, imagem: 'assets/hospitalchama.png');
  Hospital hospital2 = Hospital(nome: "HRE", descricao: "Hospital Regional de Arapiraca", id: 2, qtdEstrelas: 5, imagem: 'assets/hospitalchama.png');
  Hospital hospital3 = Hospital(nome: "CHAMA", descricao: "Complexo Hospitalar de Arapiraca Manoel André", id: 3, qtdEstrelas: 4, imagem:  'assets/hospitalchama.png');
  Hospital hospital4 = Hospital(nome: "HE", descricao: "Hospital de Emergência", id: 4, qtdEstrelas: 4, imagem: 'assets/hospitalchama.png');
  Hospital hospital5 = Hospital(nome: "HRE", descricao: "Hospital Regional de Arapiraca", id: 5, qtdEstrelas: 3, imagem: 'assets/hospitalchama.png');
  Hospital hospital6 = Hospital(nome: "CHAMA", descricao: "Complexo Hospitalar de Arapiraca Manoel André", id: 6, qtdEstrelas: 2, imagem: 'assets/hospitalchama.png');
  Hospital hospital7 = Hospital(nome: "HE", descricao: "Hospital de Emergência", id: 7, qtdEstrelas: 1, imagem: 'assets/hospitalchama.png');
  String dbName = 'saude_digital';
  String tableName = 'hospital';
  String sqlFields = 'id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT NOT NULL, descricao TEXT NOT NULL, qtdEstrelas INTEGER NOT NULL, imagem TEXT NOT NULL';

  Future<List<Hospital>> showAll() async {
    DatabaseHelper dbHelper = DatabaseHelper(dbName: dbName, tableName: tableName, sqlFields: sqlFields);
    Database database = await dbHelper.initialize();
    DatabaseService.createTable(database, tableName, sqlFields);
    database.insert(tableName, hospital.toJson());
    database.insert(tableName, hospital2.toJson());
    database.insert(tableName, hospital3.toJson());
    database.insert(tableName, hospital4.toJson());
    database.insert(tableName, hospital5.toJson());
    database.insert(tableName, hospital6.toJson());
    database.insert(tableName, hospital7.toJson());

    String sql = 'SELECT * FROM $tableName;';
    final resultSet = await database.rawQuery(sql);

    List<Hospital> list = [];
    for (var json in resultSet) {
      var newHospital = Hospital.fromJson(json);
      list.add(newHospital);
    }
    return list;
  }
}