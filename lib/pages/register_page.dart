import 'package:flutter/material.dart';

import '../widgets/register_text_field.dart';

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
  String user = '';

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
                  RegisterTextField(
                    onChange: (text) {
                      name = text;
                    },
                    icon: Icons.perm_identity_sharp,
                    fillColor: const Color(0xFFA4D8E5),
                    iconColor: Colors.white,
                    labelText: 'Nome',
                    labelColor: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  RegisterTextField(
                    onChange: (text) {
                      email = text;
                    },
                    icon: Icons.email_outlined,
                    fillColor: const Color(0xFFA4D8E5),
                    iconColor: Colors.white,
                    labelText: 'E-mail',
                    labelColor: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  RegisterTextField(
                    onChange: (text) {
                      user = text;
                    },
                    icon: Icons.perm_identity_sharp,
                    fillColor: const Color(0xFFA4D8E5),
                    iconColor: Colors.white,
                    labelText: 'Usuário',
                    labelColor: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  RegisterTextField(
                    onChange: (text) {
                      password = text;
                    },
                    icon: Icons.lock_outline,
                    fillColor: const Color(0xFFA4D8E5),
                    iconColor: Colors.white,
                    labelText: 'Senha',
                    obscureText: true,
                    labelColor: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  RegisterTextField(
                      onChange: (text) {
                        confirmPassword = text;
                      },
                      icon: Icons.lock_outline,
                      fillColor: const Color(0xFFA4D8E5),
                      iconColor: Colors.white,
                      obscureText: true,
                      labelText: 'Confirmar senha',
                      labelColor: Colors.white),
                  const SizedBox(height: 10),
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
                      onPressed: () {},
                      child: const Text(
                        'Confirmar',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
