class Item {
  int? id;
  String? libelle;

  Item({this.id, this.libelle});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    libelle = json['libelle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['libelle'] = libelle;
    return data;
  }
}
