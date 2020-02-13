class CardaAPI {
  List<Cardapio> cardapio;

  CardaAPI({this.cardapio});

  CardaAPI.fromJson(Map<String, dynamic> json) {
    if (json['cardapio'] != null) {
      cardapio = new List<Cardapio>();
      json['cardapio'].forEach((v) {
        cardapio.add(new Cardapio.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cardapio != null) {
      data['cardapio'] = this.cardapio.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cardapio {
  String nomeCategoria;
  String acompanhamento;
  String descricao;
  String nomePrato;
  String preco;
  String idPrato;
  String img;

  Cardapio(
      {this.nomeCategoria,
      this.acompanhamento,
      this.descricao,
      this.nomePrato,
      this.preco,
      this.idPrato,
      this.img});

  Cardapio.fromJson(Map<String, dynamic> json) {
    nomeCategoria = json['Nome_Categoria'];
    acompanhamento = json['Acompanhamento'];
    descricao = json['Descricao'];
    nomePrato = json['Nome_Prato'];
    preco = json['Preco'];
    idPrato = json['idPrato'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Nome_Categoria'] = this.nomeCategoria;
    data['Acompanhamento'] = this.acompanhamento;
    data['Descricao'] = this.descricao;
    data['Nome_Prato'] = this.nomePrato;
    data['Preco'] = this.preco;
    data['idPrato'] = this.idPrato;
    data['img'] = this.img;
    return data;
  }
}