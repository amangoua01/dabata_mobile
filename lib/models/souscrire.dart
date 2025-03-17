class Souscrire {
  String? dateLivraison;
  String? carte;
  int? etat;

  Souscrire({this.dateLivraison, this.carte, this.etat});

  Souscrire.fromJson(Map<String, dynamic> json) {
    dateLivraison = json['dateLivraison'];
    carte = json['carte'];
    etat = json['etat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['etat'] = etat;
    data['carte'] = carte;
    data['dateLivraison'] = dateLivraison;
    return data;
  }
}
