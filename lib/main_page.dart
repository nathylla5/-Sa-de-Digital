import 'package:flutter/material.dart';
import 'package:flutter_application_2/login_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 500,
                padding: const EdgeInsets.symmetric(vertical: 100.0),
                alignment: Alignment.bottomCenter,
                child: Image.asset('assets/Logo.png'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const LoginPage();
                  }));
                },
                child: const Text(
                  'Entrar',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                width: 100,
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                alignment: Alignment.center,
                child: Image.asset('assets/from.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
