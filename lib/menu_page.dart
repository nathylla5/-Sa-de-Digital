import 'package:flutter/material.dart';

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
        backgroundColor: Colors.cyan[600],
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: heightSizedBox),
          buildRowWithButtons(
              backgroundColor: backgroundColor,
              urlLeftImage: 'assets/alarme.png',
              urlRightImage: 'assets/remedio.png'),
          SizedBox(height: heightSizedBox),
          buildRowWithButtons(
              backgroundColor: backgroundColor,
              urlLeftImage: 'assets/tabela_lista.png',
              urlRightImage: 'assets/caixa_doacao.png'),
          SizedBox(height: heightSizedBox),
          buildRowWithButtons(
              backgroundColor: backgroundColor,
              urlLeftImage: 'assets/unidade_saude.png',
              urlRightImage: 'assets/ambulancia.png'),
          Image.asset(
            'assets/Logo.png',
            width: 150,
            height: 150,
          )
        ],
      ),
    );
  }

  buildButton({required dynamic backgroundColor, required String urlImage}) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      elevation: 5,
      child: Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              color: Colors.cyan,
              width: 2.0,
            ),
          ),
          child: IconButton(
            style: IconButton.styleFrom(backgroundColor: backgroundColor),
            onPressed: () {},
            icon: Image.asset(
              urlImage,
              width: double.infinity,
              height: double.infinity,
            ),
          )),
    );
  }

  buildRowWithButtons(
      {required dynamic backgroundColor,
      required String urlLeftImage,
      required String urlRightImage}) {
    return Row(
      children: [
        SizedBox(width: 50),
        Expanded(
          child: buildButton(
            backgroundColor: backgroundColor,
            urlImage: urlLeftImage,
          ),
        ),
        SizedBox(width: 60),
        Expanded(
          child: buildButton(
            backgroundColor: backgroundColor,
            urlImage: urlRightImage,
          ),
        ),
        SizedBox(width: 50),
      ],
    );
  }
}
