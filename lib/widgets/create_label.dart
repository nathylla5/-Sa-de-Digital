import 'package:flutter/material.dart';

class CreateLabel extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String labelText;
  final Color labelColor;
  final Color fillColor;
  final Color iconColor;
  final IconData icon;
  final bool obscureText;
  final double horizonte;

  CreateLabel(
      {Key? key,
      required this.onChanged,
      required this.labelText,
      required this.labelColor,
      required this.fillColor,
      required this.iconColor,
      required this.icon,
      required this.obscureText,
      required this.horizonte})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreateLabel();
}

class _CreateLabel extends State<CreateLabel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: EdgeInsets.symmetric(horizontal: widget.horizonte),
      child: TextField(
        obscureText: widget.obscureText,
        onChanged: widget.onChanged,
        style: TextStyle(color: Colors.white, fontSize: 15),
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          hintText: widget.labelText,
          hintStyle: TextStyle(color: widget.labelColor),
          filled: true,
          fillColor: widget.fillColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Padding(
            child: Icon(widget.icon, color: widget.iconColor),
            padding: EdgeInsets.all(5),
          ),
        ),
      ),
    );
  }
}
