import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/menu_page.dart';
import 'package:flutter_application_2/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _isChecked = false;
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
                  width: 220,
                )),
          ),
          SizedBox(height: 40.0),
          Container(
              height: 44.0,
              child: TextField(
                style: TextStyle(fontSize: 15.0, color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Usuário',
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: const Color(0x450292B7),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Padding( 
                    child: Icon(Icons.person_2_outlined, color: Colors.white),
                    padding: EdgeInsets.all(5),
                  ),
                ),
              )),
          SizedBox(height: 20.0),
          Container(
              height: 44.0,
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                style: TextStyle(
                  fontSize: 15.0,
                ),
                decoration: InputDecoration(
                  hintText: 'Senha',
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: const Color(0x450292B7),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Padding(
                    child: Icon(Icons.lock_outline, color: Colors.white),
                    padding: EdgeInsets.all(5),
                  ),
                ),
              )),
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
          SizedBox(height: 20.0),
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
          SizedBox(height: 20.0),
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
