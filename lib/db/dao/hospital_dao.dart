import '../../domain/hospital.dart';

class HospitalDao {
  List<Hospital> hospitais = const [
    Hospital(
      nome: 'HE',
      descricao: 'Hospital de Emergência',
      imagem: 'assets/hospitalhe.png',
      qtdEstrelas: 5,
    ),
    Hospital(
      nome: 'CHAMA',
      descricao: 'COMPLEXO HOSPITALAR MANOEL ANDRÉ',
      imagem: 'assets/hospitalchama.png',
      qtdEstrelas: 4,
    ),
    Hospital(
      nome: 'REGIONAL',
      descricao: 'Hospital Regional Nossa Senhora do Bom Conselho',
      imagem: 'assets/hospitalregional.png',
      qtdEstrelas: 5,
    ),
  ];

  Future<List<Hospital>> findAll() async {
    await Future.delayed(const Duration(seconds: 2));
    return hospitais;
  }
}
