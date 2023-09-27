import 'package:flutter/material.dart';
import 'package:flutter_application_2/db/services/auth_service.dart';
import 'package:flutter_application_2/pages/alarm_page.dart';
import 'package:flutter_application_2/pages/donations_page.dart';
import 'package:flutter_application_2/pages/login_page.dart';
import 'package:flutter_application_2/pages/profile_page.dart';
import 'package:flutter_application_2/pages/medicamentos_page.dart';
import 'package:flutter_application_2/pages/hospital_page.dart';
import 'package:flutter_application_2/widgets/menu_button.dart';
import 'package:provider/provider.dart';

final constNames = [
  'Alarmes',
  'Remédios',
  'Tabela',
  'Doações',
  'Unidades de Saúde',
  'Ambulância'
];

class MenuView extends StatefulWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  double heightSizedBox = 10.0;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.cyan[400],
        elevation: 10,
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<AuthService>(context, listen: false).logout();
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const LoginPage();
              }));
            },
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        leading: IconButton(
          iconSize: 60,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ProfileView(),
            ));
          },
          icon: const Icon(
            Icons.account_circle,
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: heightSizedBox),
          MenuButton(
            backgroundColor: backgroundColor,
            urlImage: 'assets/alarme.png',
            nextPage: const AlarmsView(),
            text: 'Alarmes',
          ),
          SizedBox(height: heightSizedBox),
          MenuButton(
            backgroundColor: backgroundColor,
            urlImage: 'assets/remedio.png',
            nextPage: const MedicamentoPage(),
            text: 'Remédios',
          ),
          SizedBox(height: heightSizedBox),
          MenuButton(
            backgroundColor: backgroundColor,
            urlImage: 'assets/tabela_lista.png',
            nextPage: const MenuView(),
            text: 'Tabela',
          ),
          SizedBox(height: heightSizedBox),
          MenuButton(
            backgroundColor: backgroundColor,
            urlImage: 'assets/caixa_doacao.png',
            nextPage: const DonationsView(),
            text: 'Doações',
          ),
          SizedBox(height: heightSizedBox),
          MenuButton(
            backgroundColor: backgroundColor,
            urlImage: 'assets/unidade_saude.png',
            nextPage: const HospitalPage(),
            text: 'Unidade de Saúde',
          ),
          SizedBox(height: heightSizedBox),
          MenuButton(
            backgroundColor: backgroundColor,
            urlImage: 'assets/ambulancia.png',
            nextPage: const MenuView(),
            text: 'Ambulância',
          ),
          SizedBox(height: heightSizedBox),
          Hero(
            tag: 'imageHero',
            child: Image.asset(
              'assets/Logo.png',
              width: 150,
              height: 150,
            ),
          )
        ],
      ),
    );
  }
}
