import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/tarsis_sleepando.jpeg'),
          ),
          SizedBox(height: 15.0),
          Text(
            'Nome do paciente',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.cyan),
          ),
          Text(
            '@nomedopaciente5',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          SizedBox(height: 30),
          Text('Está chegando o dia de voltar ao médico!',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan[600])),
          SizedBox(height: 4),
          Text('FALTAM EXATAMENTE:',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan[600])),
          SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 20),
              Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Colors.cyan[700],
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text('1',
                          style:
                              TextStyle(fontSize: 28, color: Colors.white)))),
              SizedBox(width: 20),
              Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.cyan[700],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Text(
                    '7',
                    style: TextStyle(fontSize: 28, color: Colors.white),
                  ))),
              SizedBox(width: 20),
              Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Colors.cyan[700],
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text('27',
                          style:
                              TextStyle(fontSize: 28, color: Colors.white)))),
              SizedBox(width: 20),
            ],
          ),
          SizedBox(height: 35.0),
          Text('Dados do Paciente',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan[600])),
          SizedBox(height: 10),
          Text('Nome Completo:',
              style: TextStyle(fontSize: 18, color: Colors.cyan[300])),
          Text('Tarsis Marinheiro',
              style: TextStyle(fontSize: 16, color: Colors.grey)),
          Text('Data de Nascimento:',
              style: TextStyle(fontSize: 18, color: Colors.cyan[300])),
          Text('12/02/1870',
              style: TextStyle(fontSize: 16, color: Colors.grey)),
          Text('Idade:',
              style: TextStyle(fontSize: 18, color: Colors.cyan[300])),
          Text('37 anos', style: TextStyle(fontSize: 16, color: Colors.grey)),
          Text('Telefone:',
              style: TextStyle(fontSize: 18, color: Colors.cyan[300])),
          Text('(82) 99999-9999',
              style: TextStyle(fontSize: 16, color: Colors.grey)),
          Text('Doenças:',
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 18, color: Colors.cyan[300])),
          Text('Hipertensão, Diabetes.',
              style: TextStyle(fontSize: 16, color: Colors.grey)),
          SizedBox(height: 20),
          Text('Editar perfil',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan[600]))
        ],
      ),
    );
  }
}
