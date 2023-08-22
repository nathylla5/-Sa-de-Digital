import 'package:flutter/material.dart';

import '../widgets/lista_hospitais.dart';

class HospitalPage extends StatefulWidget {
  const HospitalPage({Key? key}) : super(key: key);

  @override
  State<HospitalPage> createState() => _HospitalPageState();
}

class _HospitalPageState extends State<HospitalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        title: const Text(
          'Hospitais',
          style: TextStyle(color: Colors.cyan, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: Container(
          margin: const EdgeInsets.only(left: 16),
          child: IconButton(
            iconSize: 40,
            color: Colors.cyan,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: TextFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.cyan),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.cyan),
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: Icon(Icons.search, color: Colors.cyan),
                filled: false,
              ),
            ),
          ), 
          const SizedBox(height: 15),
          ListaHospitais(),
        ],
      ),
    );
  }
}