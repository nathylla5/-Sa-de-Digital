import 'package:flutter/material.dart';
import 'package:flutter_application_2/db/dao/user_dao.dart';
import 'package:flutter_application_2/pages/menu_page.dart';
import 'package:flutter_application_2/pages/register_page.dart';

import '../widgets/create_label.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _isChecked = false;
  String usuario = '';
  String senha = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //loadUsers();
  }

  //void loadUsers() {
  //  var data = new UserDao().getInfoProfile(usuario);
  //  print(data.toString());
  //}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      margin: EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Hero(
                tag: 'imageHero',
                child: Image.asset(
                  'assets/Logo.png',
                  width: 320,
                )),
          ),
          SizedBox(height: 10),
          CreateLabel(
              onChanged: (text) {
                usuario = text;
              },
              icon: Icons.perm_identity_sharp,
              fillColor: const Color(0xFFA4D8E5),
              iconColor: Colors.white,
              labelText: 'Usuário',
              labelColor: Colors.white,
              obscureText: false,
              horizonte: 10),
          SizedBox(height: 10),
          CreateLabel(
              onChanged: (text) {
                senha = text;
              },
              icon: Icons.lock_outline,
              fillColor: const Color(0xFFA4D8E5),
              iconColor: Colors.white,
              labelText: 'Senha',
              labelColor: Colors.white,
              obscureText: true,
              horizonte: 10),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Esqueceu a senha?',
                    style: TextStyle(color: const Color(0xFF0292B7)),
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: CheckboxListTile(
              title: Text('Aceito os termos de uso'),
              enabled: true,
              dense: true,
              activeColor: const Color(0xFF0292B7),
              checkColor: Colors.white,
              side: BorderSide(color: const Color(0xFF0292B7)),
              value: _isChecked,
              onChanged: (newValue) {
                setState(() {
                  _isChecked = newValue!;
                });
              },
              controlAffinity: ListTileControlAffinity
                  .leading, //  <-- Define posição do checkbox
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0292B7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const MenuView();
                }));
              },
              child: Text(
                'Entrar',
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
          ),
          Container(
              width: double.infinity,
              child: TextButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0292B7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const RegisterView();
                  }));
                },
                child: Text(
                  'Cadastrar',
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              )),
        ],
      ),
    )));
  }
}
