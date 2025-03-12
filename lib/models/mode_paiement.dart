class ModePaiement {
  int? id;
  String? libelle;

  ModePaiement({
    this.id,
    this.libelle,
  });

  factory ModePaiement.fromJson(Map<String, dynamic> json) {
    return ModePaiement(
      id: json['id'],
      libelle: json['libelle'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'libelle': libelle,
    };
  }
}
