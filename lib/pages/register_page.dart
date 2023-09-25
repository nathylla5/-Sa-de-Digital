import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/user.dart';
import 'package:flutter_application_2/pages/login_page.dart';
import 'package:flutter_application_2/widgets/show_dialog.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';
import '../db/dao/user_dao.dart';
import '../db/db_helper/database_helper.dart';
import '../widgets/create_label.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String name = '';
  String password = '';
  String confirmPassword = '';
  String email = '';
  String birthDate = '';
  String usuario = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: ListView(children: [
      Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 400,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                alignment: Alignment.center,
                child: Image.asset('assets/Logo.png'),
              ),
              CreateLabel(
                onChanged: (text) {
                  name = text;
                },
                icon: Icons.perm_identity_sharp,
                fillColor: const Color(0xFFA4D8E5),
                iconColor: Colors.white,
                labelText: 'Nome completo',
                labelColor: Colors.white,
                obscureText: false,
                horizonte: 15,
              ),
              const SizedBox(height: 10),
              CreateLabel(
                onChanged: (text) {
                  email = text;
                },
                icon: Icons.mail_outline,
                fillColor: const Color(0xFFA4D8E5),
                iconColor: Colors.white,
                labelText: 'Email',
                labelColor: Colors.white,
                obscureText: false,
                horizonte: 15,
              ),
              const SizedBox(height: 10),
              CreateLabel(
                onChanged: (text) {
                  birthDate = text;
                },
                icon: Icons.calendar_today,
                fillColor: const Color(0xFFA4D8E5),
                iconColor: Colors.white,
                labelText: 'Data da Nascimento',
                labelColor: Colors.white,
                obscureText: false,
                horizonte: 15,
              ),
              const SizedBox(
                height: 10),
              CreateLabel(
                onChanged: (text) {
                  password = text;
                },
                icon: Icons.lock,
                fillColor: const Color(0xFFA4D8E5),
                iconColor: Colors.white,
                labelText: 'Senha',
                labelColor: Colors.white,
                obscureText: true,
                horizonte: 15,
              ),
              const SizedBox(height: 10),
              CreateLabel(
                onChanged: (text) {
                  password = text;
                },
                icon: Icons.lock,
                fillColor: const Color(0xFFA4D8E5),
                iconColor: Colors.white,
                labelText: 'Confirme a senha',
                labelColor: Colors.white,
                obscureText: true,
                horizonte: 15,
              ),
              const SizedBox(height: 10),
              CreateLabel(
                onChanged: (text) {
                  usuario = text;
                },
                icon: Icons.lock,
                fillColor: const Color(0xFFA4D8E5),
                iconColor: Colors.white,
                labelText: 'Usuário',
                labelColor: Colors.white,
                obscureText: false,
                horizonte: 15,
              ),
              Container(
                height: 45,
                child: TextButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0292B7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 110.0),
                  ),
                  child: Text(
                    'Confirmar',
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  onPressed: addUser,
                ),
              ),
              SizedBox(height: 40),
            ],
          ))
    ])));
  }

  void addUser() async {
    print("Clique sucesso!");
    var uuid = const Uuid();
    final userBuilder = UserBuilder()
        .withID(uuid.v1())
        .withName(name)
        .withEmail(email)
        .withPassword(password)
        .withDate(birthDate);

    final user = userBuilder.build();

    UserDao().insertUser(user);
    showDialog(
      context: context,
      builder: (context) {
        return SuccessRegisterDialog(
          context: context,
          //urlImage: "",
          primaryText: "SUCESSO!",
          secondText: "Sua conta foi criada!",
          page: "login",
          nextPage: LoginPage(),
        );
      },
    );
  }
}
