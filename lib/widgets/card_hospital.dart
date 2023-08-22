import 'package:flutter/material.dart';

import '../domain/hospital.dart';

class CardHospital extends StatefulWidget {
  final Hospital hospital;

  const CardHospital({Key? key, required this.hospital}) : super(key: key);

  @override
  State<CardHospital> createState() => _CardHospitalState();
}

class _CardHospitalState extends State<CardHospital> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        color: Colors.grey[100],
        child: ListTile(
          leading: Image.asset(
            widget.hospital.imagem,
            width: 100,
            height: 100,
          ),
          title: Text(
            widget.hospital.nome,
            style: const TextStyle(
              color: Color(0xff0e9099),
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.hospital.descricao,
                style: const TextStyle(
                  color: Color(0xff0e9099),
                ),
              ),
              Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    index < widget.hospital.qtdEstrelas
                        ? Icons.star
                        : Icons.star_border,
                    color: const Color(0xff0e9099),
                  ),
                ),
              )
            ],
          ),
          onTap: () => {},
        ),
      ),
    );
  }
}
