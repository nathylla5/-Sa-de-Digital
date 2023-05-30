import 'package:flutter/material.dart';
import 'package:flutter_application_2/mainPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela de Início',
      home: Scaffold(
        body: MainPage(),
      ),
    );
  }
}
