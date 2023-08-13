import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/card_image.dart';

class MenuButton extends StatefulWidget {
  final dynamic backgroundColor;
  final String urlImage;
  final Widget nextPage;
  final String text;

  const MenuButton(
      {Key? key,
      required this.backgroundColor,
      required this.urlImage,
      required this.nextPage,
      required this.text,})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => widget.nextPage),
        );
      },
      child: Row(
        children: [
          const SizedBox(width: 15),
          CardImage(urlImage: widget.urlImage),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              widget.text,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan[700]),
            ),
          ),
        ],
      ),
    );
  }
}
