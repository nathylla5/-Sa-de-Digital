import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/alarm_page.dart';
import 'package:flutter_application_2/pages/donations_page.dart';
import 'package:flutter_application_2/pages/login_page.dart';

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
            onPressed: () {},
            icon: const Icon(
              Icons.account_circle,
            )),
      ),
      body: ListView(
        children: [
          SizedBox(height: heightSizedBox),
          buildButton(
            backgroundColor: backgroundColor,
            urlImage: 'assets/alarme.png',
            nextPage: AlarmsView(),
            text: constNames[0],
            page: constNames[0],
            primaryText: constNames[0],
            secondText: 'Agende suas medicações',
          ),
          SizedBox(height: heightSizedBox),
          buildButton(
              backgroundColor: backgroundColor,
              urlImage: 'assets/remedio.png',
              nextPage: LoginPage(),
              text: 'Remédios',
              page: constNames[1],
              primaryText: constNames[1],
              secondText: ''),
          SizedBox(height: heightSizedBox),
          buildButton(
              backgroundColor: backgroundColor,
              urlImage: 'assets/tabela_lista.png',
              nextPage: LoginPage(),
              text: 'Tabela',
              page: constNames[2],
              primaryText: constNames[2],
              secondText: ''),
          SizedBox(height: heightSizedBox),
          buildButton(
              backgroundColor: backgroundColor,
              urlImage: 'assets/caixa_doacao.png',
              nextPage: DonationsView(),
              text: 'Doações',
              page: constNames[3],
              primaryText: constNames[3],
              secondText: ''),
          SizedBox(height: heightSizedBox),
          buildButton(
              backgroundColor: backgroundColor,
              urlImage: 'assets/unidade_saude.png',
              nextPage: LoginPage(),
              text: 'Unidade de Saúde',
              page: constNames[4],
              primaryText: constNames[4],
              secondText: ''),
          SizedBox(height: heightSizedBox),
          buildButton(
              backgroundColor: backgroundColor,
              urlImage: 'assets/ambulancia.png',
              nextPage: LoginPage(),
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

  buildButton({
    required dynamic backgroundColor,
    required String urlImage,
    required Widget nextPage,
    required String text,
    required String page,
    required String primaryText,
    required String secondText,
  }) {
    return GestureDetector(
      onTap: () {
        showAlertDialog(context,
            nextPage: nextPage,
            page: page,
            primaryText: primaryText,
            secondText: secondText,
            urlImage: urlImage);
      },
      child: Row(
        children: [
          const SizedBox(width: 15),
          buildCardImage(urlImage: urlImage),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildCardImage({required String urlImage}) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      elevation: 5,
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: Colors.cyan,
            width: 2.0,
          ),
        ),
        child: Image.asset(
          urlImage,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context,
      {required Widget nextPage,
      required String page,
      required String primaryText,
      required String secondText,
      required String urlImage}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.cyan,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: Container(
            height: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildCardImage(urlImage: urlImage),
                const SizedBox(height: 16),
                Text(primaryText,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                const SizedBox(height: 16),
                Text(secondText, style: TextStyle(color: Colors.grey[300])),
                const SizedBox(height: 16),
                ButtonTheme(
                  minWidth: 300,
                  height: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => nextPage),
                      );
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(0, 131, 143, 1)),
                    ),
                    child: Text(
                      'Ir para tela de ' + page,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
