
import '../../domain/medicamentos.dart';

class MedicamentoDao {
   List<Medicamento> listaMedicamentos = const [
    Medicamento(
      nome: 'Tylenol',
      imagemAssetPath: 'assets/medicamento6.png',
      descricao: 'Este medicamento é indicado para aliviar dores leves e moderadas. Consulte o seu médico antes de usar.',
      componentes: 'Paracetamol, Excipientes q.s.p.',
      efeitos: 'Pode causar sonolência e reações alérgicas em alguns casos.',
    ),
    Medicamento(
      nome: 'Loratadina',
      imagemAssetPath: 'assets/medicamento2.png',
      descricao: 'Este medicamento é utilizado para tratamento de alergias. Mantenha fora do alcance de crianças.',
      componentes: 'Cloridrato de Loratadina, Excipientes q.s.p.',
      efeitos: 'Pode causar leve sonolência em alguns casos.',
    ),
    Medicamento(
      nome: 'Malox',
      imagemAssetPath: 'assets/medicamento3.png',
      descricao: 'Este medicamento é indicado para tratar problemas gastrointestinais. Consulte um profissional de saúde.',
      componentes: 'Hidróxido de Alumínio, Hidróxido de Magnésio, Excipientes q.s.p.',
      efeitos: 'Pode causar alterações no funcionamento do intestino.',
    ),
    Medicamento(
      nome: 'Dorflex',
      imagemAssetPath: 'assets/medicamento4.png',
      descricao: 'Este medicamento é utilizado como relaxante muscular. Não deve ser usado sem orientação médica.',
      componentes: 'Citrato de Orfenadrina, Excipientes q.s.p.',
      efeitos: 'Pode causar sonolência e tonturas.',
    ),
    Medicamento(
      nome: 'Sumax',
      imagemAssetPath: 'assets/medicamento5.png',
      descricao: 'Este medicamento é indicado para tratamento de enxaqueca. Siga as instruções da bula.',
      componentes: 'Sumatriptano, Excipientes q.s.p.',
      efeitos: 'Pode causar sensação de calor, formigamento e reações no local de aplicação.',
    ),
    Medicamento(
      nome: 'Salonpas',
      imagemAssetPath: 'assets/medicamento1.png',
      descricao: 'Este medicamento é utilizado para alívio temporário de dores musculares e articulares.',
      componentes: 'Cânfora, Mentol, Salicilato de Metila, Excipientes q.s.p.',
      efeitos: 'Pode causar irritações na pele em algumas pessoas.',
    ),
  ];

  Future<List<Medicamento>> findAll() async {
    await Future.delayed(const Duration(seconds: 3));
    return listaMedicamentos;
  }
}
