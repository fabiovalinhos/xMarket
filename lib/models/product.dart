class Product {
  int id;
  String produto;
  String localizacao;

  Product({this.id, this.produto, this.localizacao});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    produto = json['produto'];
    localizacao = json['localizacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['produto'] = this.produto;
    data['localizacao'] = this.localizacao;
    return data;
  }
}
