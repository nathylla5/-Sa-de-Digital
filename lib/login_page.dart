import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/Logo.png'),
            Flexible(child: TextField(
              decoration: InputDecoration(
                hintText: 'Usuário',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(51)
                ),
              ),
            )),
            Flexible(child: TextField(
              decoration: InputDecoration(
                hintText: 'Senha',
                fillColor: Color.fromARGB(2, 146, 183, 36),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(51)
                ),
              ),
            )),
            
          ],
        ),
      )
    );
  }
}