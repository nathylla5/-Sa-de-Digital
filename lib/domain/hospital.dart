class Hospital {
  late int id;
  late String nome;
  late int qtdEstrelas;
  late String descricao;
  late String imagem;

  Hospital(
      {required this.id, required this.nome, required this.qtdEstrelas, required this.descricao, required this.imagem});

  Hospital.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    qtdEstrelas = json['qtdEstrelas'];
    descricao = json['descricao'];
    imagem = json['imagem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['qtdEstrelas'] = this.qtdEstrelas;
    data['descricao'] = this.descricao;
    data['imagem'] = this.imagem;
    return data;
  }
}