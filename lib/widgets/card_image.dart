import 'package:flutter/material.dart';

class CardImage extends StatefulWidget {
  final String urlImage;

  const CardImage({Key? key, required this.urlImage}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CardImageState();
}

class _CardImageState extends State<CardImage> {
  @override
  Widget build(BuildContext context) {
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
          widget.urlImage,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
