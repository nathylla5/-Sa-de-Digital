import 'package:flutter_application_2/db/db_helper/database_service.dart';
import 'package:sqflite/sqflite.dart';

import '../../domain/medicamentos.dart';
import '../db_helper/database_helper.dart';

class MedicamentoDao {
  String sqlFields =
      'nome VARCHAR(1000) PRIMARY KEY, imagem varchar(1000), efeitos varchar(1000), descricao varchar(1000), componentes varchar(1000)';
  String dbName = 'saude_digital';
  String tableName = 'medicamentos';

  Medicamento med1 = Medicamento(
      nome: 'Tylenol',
      imagem:
      'https://i5.walmartimages.com/seo/Tylenol-Extra-Strength-Caplets-with-500-mg-Acetaminophen-225-Ct_a059ee23-2fe8-464c-8a30-7cb7eecd08fd.5e206ee38e11939f7be34b925ff5e5b5.jpeg',
      efeitos: 'Pode causar sonolência e reações alérgicas em alguns casos.',
      descricao:
      'Este medicamento é indicado para aliviar dores leves e moderadas. Consulte o seu médico antes de usar.',
      componentes: 'Paracetamol, Excipientes q.s.p.');

  Medicamento med2 = Medicamento(
      nome: 'Loratadina',
      imagem:
      'https://d2kh0jmrbw4y83.cloudfront.net/Custom/Content/Products/31/70/31709_loratadina-10mg-12-comprimidos-cimed-generico-claritin-281952_z2_637813821848815982.jpg',
      efeitos: 'Pode causar sonolência e reações alérgicas em alguns casos.',
      descricao:
      'Este medicamento é indicado para aliviar dores leves e moderadas. Consulte o seu médico antes de usar.',
      componentes: 'Paracetamol, Excipientes q.s.p.');

  Medicamento med3 = Medicamento(nome: 'Maalox',
      imagem: 'https://www.drogarianovaesperanca.com.br/imagens-complete/1000x1000/maalox-15320025mg-com-30-comprimidos-sabor-menta-8fa446e534.jpg',
      efeitos: 'Pode causar sonolência e reações alérgicas em alguns casos.',
      descricao: 'Este medicamento é indicado para aliviar dores leves e moderadas. Consulte o seu médico antes de usar.',
      componentes: 'Paracetamol, Excipientes q.s.p.');

  Future<List<Medicamento>> findAll() async {
    DatabaseHelper dbHelper = DatabaseHelper(
        dbName: dbName, tableName: tableName, sqlFields: sqlFields);
    Database database = await dbHelper.initialize();
    DatabaseService.createTable(database, tableName, sqlFields);
    database.insert(tableName, med1.toJson());
    database.insert(tableName, med2.toJson());
    database.insert(tableName, med3.toJson());


    String sql = 'SELECT * FROM $tableName;';
    final resultSet = await database.rawQuery(sql);

    List<Medicamento> listaMedicamentos = [];
    for (var json in resultSet) {
      Medicamento pacote = Medicamento.fromJson(json);
      listaMedicamentos.add(pacote);
    }

    return listaMedicamentos;
  }
}
