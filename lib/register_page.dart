import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String nome = '';
  String email = '';
  String senha = '';
  String usuario = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
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
                  buildTextField(
                      onChanged: (text) {
                        nome = text;
                      },
                      icon: Icons.perm_identity_sharp,
                      fillColor: const Color(0xFFA4D8E5),
                      iconColor: Colors.white,
                      labelText: 'Nome',
                      labelColor: Colors.white),
                  SizedBox(height: 10),
                  buildTextField(
                      onChanged: (text) {
                        email = text;
                      },
                      icon: Icons.email_outlined,
                      fillColor: const Color(0xFFA4D8E5),
                      iconColor: Colors.white,
                      labelText: 'E-mail',
                      labelColor: Colors.white),
                  SizedBox(height: 10),
                  buildTextField(
                      onChanged: (text) {
                        usuario = text;
                      },
                      icon: Icons.perm_identity_sharp,
                      fillColor: const Color(0xFFA4D8E5),
                      iconColor: Colors.white,
                      labelText: 'Usuário',
                      labelColor: Colors.white),
                  SizedBox(height: 10),
                  buildTextField(
                      onChanged: (text) {
                        senha = text;
                      },
                      icon: Icons.lock_outline,
                      fillColor: const Color(0xFFA4D8E5),
                      iconColor: Colors.white,
                      labelText: 'Senha',
                      labelColor: Colors.white),
                  SizedBox(height: 10),
                  buildTextField(
                      onChanged: (text) {
                        senha = text;
                      },
                      icon: Icons.lock_outline,
                      fillColor: const Color(0xFFA4D8E5),
                      iconColor: Colors.white,
                      labelText: 'Confirmar senha',
                      labelColor: Colors.white),
                  SizedBox(height: 10),
                  Container(
                    height: 45,
                    child: TextButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0292B7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 110.0),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Confirmar',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTextField(
      {required ValueChanged<String> onChanged,
      required String labelText,
      required labelColor,
      required Color fillColor,
      required Color iconColor,
      required IconData icon}) {
    return Container(
      height: 45,
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        onChanged: onChanged,
        style: TextStyle(color: Colors.white, fontSize: 15),
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: labelColor),
          filled: true,
          fillColor: fillColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Padding(
            child: Icon(icon, color: iconColor),
            padding: EdgeInsets.all(5),
          ),
        ),
      ),
    );
  }
}
