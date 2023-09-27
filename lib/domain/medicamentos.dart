class Medicamento {
  late String nome;
  late String imagem;
  late String efeitos;
  late String descricao;
  late String componentes;

  Medicamento({
    required this.nome,
    required this.imagem,
    required this.efeitos,
    required this.descricao,
    required this.componentes,
  }) ;

  Medicamento.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    imagem = json['imagem'];
    efeitos = json['efeitos'];
    descricao = json['descricao'];
    componentes = json['componentes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['nome'] = this.nome;
    data['imagem'] = this.imagem;
    data['efeitos'] = this.efeitos;
    data['descricao'] = this.descricao;
    data['componentes'] = this.componentes;
    return data;
  }
}