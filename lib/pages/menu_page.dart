import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/alarm_page.dart';
import 'package:flutter_application_2/pages/donations_page.dart';
import 'package:flutter_application_2/pages/profile_page.dart';
import 'package:flutter_application_2/widgets/menu_button.dart';

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
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        leading: IconButton(
            iconSize: 60,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ProfileView()),
              );
            },
            icon: const Icon(
              Icons.account_circle,
            )),
      ),
      body: ListView(
        children: [
          SizedBox(height: heightSizedBox),
          MenuButton(
            backgroundColor: backgroundColor,
            urlImage: 'assets/alarme.png',
            nextPage: const AlarmsView(),
            text: constNames[0],
            page: constNames[0],
            primaryText: constNames[0],
            secondText: 'Agende suas medicações',
          ),
          SizedBox(height: heightSizedBox),
          MenuButton(
              backgroundColor: backgroundColor,
              urlImage: 'assets/remedio.png',
              nextPage: const MenuView(),
              text: 'Remédios',
              page: constNames[1],
              primaryText: constNames[1],
              secondText: ''),
          SizedBox(height: heightSizedBox),
          MenuButton(
              backgroundColor: backgroundColor,
              urlImage: 'assets/tabela_lista.png',
              nextPage: const MenuView(),
              text: 'Tabela',
              page: constNames[2],
              primaryText: constNames[2],
              secondText: ''),
          SizedBox(height: heightSizedBox),
          MenuButton(
              backgroundColor: backgroundColor,
              urlImage: 'assets/caixa_doacao.png',
              nextPage: const DonationsView(),
              text: 'Doações',
              page: constNames[3],
              primaryText: constNames[3],
              secondText: ''),
          SizedBox(height: heightSizedBox),
          MenuButton(
              backgroundColor: backgroundColor,
              urlImage: 'assets/unidade_saude.png',
              nextPage: const MenuView(),
              text: 'Unidade de Saúde',
              page: constNames[4],
              primaryText: constNames[4],
              secondText: ''),
          SizedBox(height: heightSizedBox),
          MenuButton(
              backgroundColor: backgroundColor,
              urlImage: 'assets/ambulancia.png',
              nextPage: const MenuView(),
              text: 'Ambulância',
              page: constNames[5],
              primaryText: constNames[5],
              secondText: ''),
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
