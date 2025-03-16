class CumuleArticles {
  int? itemId;
  String? libelle;
  double? quantiteCumul;

  CumuleArticles({itemId, libelle, quantiteCumul});

  CumuleArticles.fromJson(Map<String, dynamic> json) {
    itemId = json['itemId'];
    libelle = json['libelle'];
    quantiteCumul = json['quantiteCumul'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['itemId'] = itemId;
    data['libelle'] = libelle;
    data['quantiteCumul'] = quantiteCumul;
    return data;
  }
}
