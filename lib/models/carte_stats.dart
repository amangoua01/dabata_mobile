class CarteStats {
  int? carteId;
  double? montant;
  String? carteLibelle;
  String? categorieLibelle;
  int? nombreSouscriptions;

  CarteStats({
    this.carteId,
    this.montant,
    this.carteLibelle,
    this.categorieLibelle,
    this.nombreSouscriptions,
  });

  CarteStats.fromJson(Map<String, dynamic> json) {
    carteId = json['carte_id'];
    carteLibelle = json['carte_libelle'];
    categorieLibelle = json['categorie_libelle'];
    montant = json['montant'];
    nombreSouscriptions = json['nombre_souscriptions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['carte_id'] = carteId;
    data['carte_libelle'] = carteLibelle;
    data['categorie_libelle'] = categorieLibelle;
    data['montant'] = montant;
    data['nombre_souscriptions'] = nombreSouscriptions;
    return data;
  }
}
