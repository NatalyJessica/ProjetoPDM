//CLASSE PARA RETORNAR LISTA DE CADASTRADOS DA API

class lista {
  String nome;
  String data;

  lista(this.nome, this.data);

  Map tojson() => {'nome': nome, 'data': data};

  factory lista.fromJson(dynamic json) {
    if (json['data'] == null) json['data'] = "01/01/2022  00:00:00";
    return lista(json['nome'] as String, json['data'] as String);
  }

  @override
  String toString() {
    return '{${this.nome}, ${this.data}}';
  }
}
