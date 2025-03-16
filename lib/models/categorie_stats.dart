class CategorieStats {
  int? categorieId;
  String? categorieLibelle;
  int? nombreSouscriptions;

  CategorieStats(
      {this.categorieId, this.categorieLibelle, this.nombreSouscriptions});

  CategorieStats.fromJson(Map<String, dynamic> json) {
    categorieId = json['categorie_id'];
    categorieLibelle = json['categorie_libelle'];
    nombreSouscriptions = json['nombre_souscriptions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categorie_id'] = categorieId;
    data['categorie_libelle'] = categorieLibelle;
    data['nombre_souscriptions'] = nombreSouscriptions;
    return data;
  }
}
