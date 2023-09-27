import 'package:flutter/material.dart';
import '../db/dao/hospital_dao.dart';
import '../domain/hospital.dart';
import '../widgets/card_hospital.dart';

class ListaHospitais extends StatefulWidget {
  const ListaHospitais({Key? key}) : super(key: key);

  @override
  State<ListaHospitais> createState() => _ListaHospitaisState();
}

class _ListaHospitaisState extends State<ListaHospitais> {
  Future<List<Hospital>> futureHospitais = HospitalDao().showAll();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Hospital>>(
      future: futureHospitais,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Erro ao carregar aos hospitais."),
          );
        } else if (snapshot.hasData) {
          List<Hospital> hospitais = snapshot.data!;
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 10),
            shrinkWrap: true,
            itemCount: hospitais.length,
            itemBuilder: (context, index) => CardHospital(
              hospital: hospitais[index],
            ),
          );
        } else {
          return Center(
            child: Text("Nenhum dado encontrado."),
          );
        }
      },
    );
  }
}