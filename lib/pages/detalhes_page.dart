import 'package:flutter/material.dart';

import '../domain/medicamentos.dart';

class DetalhesPage extends StatefulWidget {
  final Medicamento med;

  const DetalhesPage({Key? key, required this.med}) : super(key: key);

  @override
  State<DetalhesPage> createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Color(0xFF1AC8DB)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(child: SizedBox()), 
                ],
              ),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Center(
                    child: Image.asset(
                      widget.med.imagemAssetPath,
                      height: 240,
                      width: 240,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 24),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        widget.med.nome,
                        style: TextStyle(
                          color: Color(0xFF0292B7),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 18),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Descrição",
                      style: TextStyle(
                        color: Color(0xFF0292B7),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Componentes",
                      style: TextStyle(
                        color: Color(0xFF0292B7),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      widget.med.componentes,
                      style: TextStyle(
                        color: Color(0xFFA6A6A6),
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Efeitos",
                      style: TextStyle(
                        color: Color(0xFF0292B7),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      widget.med.efeitos,
                      style: TextStyle(
                        color: Color(0xFFA6A6A6),
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
