import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/show_alert_dialog.dart';

import 'card_image.dart';

class MenuButton extends StatefulWidget {
  final dynamic backgroundColor;
  final String urlImage;
  final Widget nextPage;
  final String text;
  final String page;
  final String primaryText;
  final String secondText;

  const MenuButton(
      {Key? key,
      this.backgroundColor,
      required this.urlImage,
      required this.nextPage,
      required this.text,
      required this.page,
      required this.primaryText,
      required this.secondText})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ShowAlertDialog(
          nextPage: widget.nextPage,
          page: widget.page,
          primaryText: widget.primaryText,
          secondText: widget.secondText,
          urlImage: widget.urlImage,
          context: context,
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
