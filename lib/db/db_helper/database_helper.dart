import 'dart:async';

import 'package:sqflite/sqflite.dart' as sqlite;
import 'package:path/path.dart' as path;

import 'database_service.dart';

class DatabaseHelper {
  final String dbName;
  final String tableName;
  final String sqlFields;

  DatabaseHelper(
      {required this.dbName, required this.tableName, required this.sqlFields});

  Future<String> _fullPath(String dbName) async {
    String name = '$dbName.db';
    final dbPath = await sqlite.getDatabasesPath();
    return path.join(dbPath, name);
  }

  Future<sqlite.Database> initialize() async {
    final path = await _fullPath(dbName);
    var database = await sqlite.openDatabase(path, version: 2,
        onCreate: onCreate,
    );
    return database;
  }

  Future<void> onCreate(sqlite.Database database, int version) async {
    await DatabaseService.createTable(database, tableName, sqlFields);
    if (version != 1) {
      onUpgrade(database, 1, version);
    }
  }

  Future<FutureOr<void>> onUpgrade(
      sqlite.Database database, int oldVersion, int newVersion) async {
    if (oldVersion == 1 && newVersion == 2) {
      await DatabaseService.createTable(database, tableName, sqlFields);
    }
  }
}
