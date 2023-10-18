import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/db/services/auth_service.dart';
import 'package:provider/provider.dart';
import '../pages/login_page.dart';
import '../pages/menu_page.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void verificarUsuario() {
    var ctx = Provider.of<AuthService>(context, listen: true);
    var user = ctx.usuario;
    Widget page = const LoginPage();
    if (user != null) {
      page = const MenuView();
    }
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return page;
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    verificarUsuario();
    return loading();
  }

  Widget loading() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Logo.png',
              width: 320,
            ),
            const CircularProgressIndicator(
              color: Color(0xFF0292B7),
              strokeWidth: 6,
            ),
            const SizedBox(height: 20),
            const Text(
              'Bem-Vindo!',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
