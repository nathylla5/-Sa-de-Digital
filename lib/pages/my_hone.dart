import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLogin = true;

  void _toggleForm() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLogin ? 'Login' : 'Cadastro'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isLogin)
              Text('Formulário de Login')
            else
              Text('Formulário de Cadastro'),
            ElevatedButton(
              onPressed: _toggleForm,
              child: Text(_isLogin ? 'Não tem conta?' : 'Já tem conta?'),
            ),
          ],
        ),
      ),
    );
  }
}