/* class Articles {
  int? id;
  int? qte;
  String? libelle;

  Articles({
    this.id,
    this.qte,
    this.libelle,
  });

  Articles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    qte = json['qte'];
    // Modification pour récupérer le libellé de l'item
    libelle = json['item']?['libelle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['qte'] = qte;
    data['libelle'] = libelle;

    return data;
  }
}
 */
class Articles {
  int? id;
  int? qte;
  String? libelle;

  Articles({
    this.id,
    this.qte,
    this.libelle,
  });

  Articles.fromJson(Map<String, dynamic> json) {
    // Conversion sécurisée de l'ID
    id = _parseIntSafely(json['id']);

    // Conversion sécurisée de la quantité
    qte = _parseIntSafely(json['qte']);

    // Récupération du libellé de l'item
    libelle = json['item']?['libelle'];
  }

  // Méthode utilitaire pour convertir de manière sécurisée en int
  int? _parseIntSafely(dynamic value) {
    if (value == null) return null;

    if (value is int) return value;

    if (value is double) return value.toInt();

    if (value is String) {
      return int.tryParse(value);
    }

    return null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['qte'] = qte;
    data['libelle'] = libelle;

    return data;
  }
}
