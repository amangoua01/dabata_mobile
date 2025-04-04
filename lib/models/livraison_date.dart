class LivraisonDate {
  int? id;
  String? libelle;
  String? createdAt;

  LivraisonDate({this.id, this.libelle, this.createdAt});

  LivraisonDate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    libelle = json['libelle'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['libelle'] = libelle;
    data['createdAt'] = createdAt;
    return data;
  }
}
