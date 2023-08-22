import 'package:flutter/material.dart';

import '../db/dao/hospital_dao.dart';
import '../domain/hospital.dart';
import 'card_hospital.dart';

class ListaHospitais extends StatefulWidget {
  const ListaHospitais({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListaHospitaisState();
}

class _ListaHospitaisState extends State<ListaHospitais> {
  Future<List<Hospital>> futureHospitais = HospitalDao().findAll();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Hospital>>(
        future: futureHospitais,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Erro ao carregar hospitais'),
            );
          } else if (snapshot.hasData) {
            List<Hospital> hospitais = snapshot.data!;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: hospitais.length,
              itemBuilder: (context, index) {
                return CardHospital(hospital: hospitais[index]);
              },
            );
          } else {
            return const Center(
              child: Text('Nenhum dado encontrado'),
            );
          }
        });
  }
}
