import 'package:dabata_mobile/models/articles.dart';
import 'package:dabata_mobile/models/categorie.dart';

class Carte {
  int? id;
  String? fin;
  String? debut;
  String? libelle;
  Categorie? categorie;
  double? montantTotal;
  double? montantRendu;
  List<Articles>? articles;
  double? montantJournalier;
  double? montantCotise;

  Carte({
    this.id,
    this.fin,
    this.debut,
    this.articles,
    this.libelle,
    this.categorie,
    this.montantTotal,
    this.montantRendu,
    this.montantCotise,
    this.montantJournalier,
  });

  Carte.fromJson(Map<String, dynamic> json) {
    id = json['id'] is int ? json['id'] : int.tryParse(json['id'].toString());
    fin = json['dateFin'];
    debut = json['dateDebut'];
    libelle = json['libelle'];
    montantRendu = json['montantRendu'] is double
        ? json['montantRendu']
        : double.tryParse(json['montantRendu'].toString()) ?? 0.0;
    montantJournalier = json['montant'] is double
        ? json['montant']
        : double.tryParse(json['montant'].toString()) ?? 0.0;
    montantTotal = montantJournalier;

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
    data['montant'] = montantJournalier;
    if (categorie != null) {
      data['categorie'] = categorie!.toJson();
    }
    if (articles != null) {
      data['articles'] = articles!.map((item) => item.toJson()).toList();
    }
    return data;
  }

  // Modifiez votre méthode tauxCotisation pour utiliser montantCotise
  double get tauxCotisation {
    if (montantJournalier != null &&
        montantJournalier! > 0 &&
        montantCotise != null) {
      return (montantCotise! / montantJournalier!) * 100;
    } else {
      return 0;
    }
  }

  // Méthode pour obtenir le montant restant à cotiser
  double get montantRestant {
    if (montantJournalier != null && montantCotise != null) {
      print(
          "montantJournalier $montantJournalier  montantCotise $montantCotise");
      return montantTotal! - montantCotise!;
    } else {
      return 2;
    }
  }

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
        return "assets/images/marche-removebg.png";
    }
  }
}
