import 'package:flutter/material.dart';

import '../db/dao/medicamentos_dao.dart';
import '../domain/medicamentos.dart';
import '../widgets/remedios.dart';

class MedicamentoPage extends StatelessWidget {
  final Future<List<Medicamento>> futureListaMedicamentos = PacoteDao().findAll();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
          child: Text(
            'Medicamentos',
            style: TextStyle(
              color: Color(0xFF1AC8DB),
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFF1AC8DB),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder<List<Medicamento>>(
          future: futureListaMedicamentos,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Medicamento> listaMedicamentos = snapshot.data!;

              return ListView.builder(
                itemCount: listaMedicamentos.length,
                itemBuilder: (context, i) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Remedios(med: listaMedicamentos[i]),
                  );
                },
              );
            }

            return const Padding(
              padding: EdgeInsets.all(25),
              child: Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }
}

