import 'package:flutter/material.dart';

class CreateLabel extends StatefulWidget {
  final TextEditingController onControll;
  final String labelText;
  final Color labelColor;
  final Color fillColor;
  final Color iconColor;
  final IconData icon;
  final bool obscureText;
  final double horizonte;
  final TextInputType tipo;
  final int tamanho;
  final FormFieldValidator<String> validator;

  const CreateLabel(
      {Key? key,
      required this.onControll,
      required this.labelText,
      required this.labelColor,
      required this.fillColor,
      required this.iconColor,
      required this.icon,
      required this.obscureText,
      required this.horizonte,
      required this.tipo,
      required this.tamanho,
      required this.validator})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreateLabel();
}

class _CreateLabel extends State<CreateLabel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 45,
      //padding: EdgeInsets.symmetric(horizontal: widget.horizonte),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: widget.onControll,
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
        style: const TextStyle(color: Colors.white, fontSize: 15),
        obscureText: widget.obscureText,
        keyboardType: widget.tipo,
        validator: widget.validator,
      ),
    );
  }
}
