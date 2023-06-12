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
        body: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              /*Container(
                width: 500,
                padding: const EdgeInsets.symmetric(vertical: 100.0),
                alignment: Alignment.bottomCenter,
                child: Image.asset('assets/Logo.png'),
              ),*/
              Flexible(
                child: Container(),
                flex: 1,
              ),
              Flexible(
                flex: 1,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const LoginPage();
                      
                    }));
                  },
                  child: Hero(
                      tag: 'imageHero', child: Image.asset('assets/Logo.png')),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: 100,
                  alignment: Alignment.bottomCenter,
                  child: Image.asset('assets/from.png'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}