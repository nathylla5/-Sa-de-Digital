import 'package:flutter/material.dart';

import '../pages/menu_page.dart';

class CreateButton extends StatefulWidget {
  final String mensage;

  const CreateButton({Key? key, required this.mensage}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreateButton();
}

class _CreateButton extends State<CreateButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF0292B7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const MenuView();
          }));
        },
        child: Text(
          widget.mensage,
          style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
    );
  }
}
