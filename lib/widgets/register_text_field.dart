import 'package:flutter/material.dart';

class RegisterTextField extends StatefulWidget {
  final Function(String text) onChange;
  final String labelText;
  final Color labelColor;
  final Color fillColor;
  final Color iconColor;
  final IconData icon;
  final bool obscureText;

  const RegisterTextField({
    Key? key,
    this.obscureText = false,
    required this.labelText,
    required this.labelColor,
    required this.fillColor,
    required this.iconColor,
    required this.icon,
    required this.onChange,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegisterTextFieldState();
}

class _RegisterTextFieldState extends State<RegisterTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        obscureText: widget.obscureText,
        onChanged: widget.onChange,
        style: const TextStyle(color: Colors.white, fontSize: 15),
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: TextStyle(color: widget.labelColor),
          filled: true,
          fillColor: widget.fillColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Padding(
            child: Icon(widget.icon, color: widget.iconColor),
            padding: const EdgeInsets.all(5),
          ),
        ),
      ),
    );
  }
}
