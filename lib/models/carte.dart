import 'package:dabata_mobile/models/articles.dart';
import 'package:dabata_mobile/models/categorie.dart';
import 'package:dabata_mobile/tools/extensions/types/string.dart';

class Carte {
  int? id;
  String? fin;
  String? debut;
  String? libelle;
  Categorie? categorie;
  double? montantTotal;
  double? montantRendu;
  List<Articles>? articles;

  Carte({
    this.id,
    this.fin,
    this.debut,
    this.articles,
    this.libelle,
    this.categorie,
    this.montantTotal,
    this.montantRendu,
  });

  Carte.fromJson(Map<String, dynamic> json) {
    id = json['id'] is int ? json['id'] : int.tryParse(json['id'].toString());
    fin = json['dateFin'];
    debut = json['dateDebut'];
    libelle = json['libelle'];
    montantRendu = json['montantRendu'] is double
        ? json['montantRendu']
        : double.tryParse(json['montantRendu'].toString()) ?? 0.0;
    montantTotal = json['montant'] is double
        ? json['montant']
        : double.tryParse(json['montant'].toString()) ?? 0.0;

    categorie = json['categorie'] != null
        ? Categorie.fromJson(
            json['categorie'] is Map ? json['categorie'] : json['categorie'])
        : null;
    articles = json['articles'] != null
        ? (json['articles'] as List)
            .map((item) => Articles.fromJson(item))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dateFin'] = fin;
    data['dateDebut'] = debut;
    data['libelle'] = libelle;
    data['montantRendu'] = montantRendu;
    data['montant'] = montantTotal;
    if (categorie != null) {
      data['categorie'] = categorie!.toJson();
    }
    if (articles != null) {
      data['articles'] = articles!.map((item) => item.toJson()).toList();
    }
    return data;
  }

  double? get montantJournalier => libelle.value.split("-").first.toDouble();

  String get image {
    if (categorie == null || categorie!.libelle == null) {
      return "assets/images/marche.jpeg";
    }

    switch (categorie!.libelle) {
      case 'Marché':
        return "assets/images/marche-removebg.png";
      case 'Mixte':
        return "assets/images/mixte-removebg.png";
      default:
        return "assets/images/gadget-removebg.png";
    }
  }
}
