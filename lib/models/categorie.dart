class Categorie {
  int? id;
  String? libelle;

  Categorie({this.id, this.libelle});

  Categorie.fromJson(dynamic json) {
    // Si json est déjà un Map
    if (json is Map) {
      id = json['id'] is int ? json['id'] : int.tryParse(json['id'].toString());
      libelle = json['libelle'];
    }
    // Si json est une chaîne (par exemple un identifiant)
    else if (json is String) {
      // Logique de parsing si nécessaire
      id = int.tryParse(json);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['libelle'] = libelle;
    return data;
  }
}
