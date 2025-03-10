import 'package:dabata_mobile/models/articles.dart';
import 'package:dabata_mobile/models/categorie.dart';
import 'package:dabata_mobile/tools/extensions/types/double.dart';

/* class Carte {
  int? id;
  String? fin;
  String? image;
  String? debut;
  String? libelle;
  Categorie? categorie;
  List<Articles>? article;
  int? montantJournalier, montantTotal, montantRendu;

  Carte({
    this.id,
    this.fin,
    this.image,
    this.debut,
    this.article,
    this.libelle,
    this.categorie,
    this.montantTotal,
    this.montantRendu,
    this.montantJournalier,
  });

  Carte.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fin = json['dateFin'];
    image = json['image'];
    debut = json['dateDebut'];
    libelle = json['libelle'];
    montantRendu = json['montantRendu'];
    montantJournalier = json['montant'];
    categorie = json['categorie'] != null
        ? Categorie.fromJson(json['categorie'])
        : null;
    // Mise à jour de la récupération des articles
    article = json['articles'] != null
        ? (json['articles'] as List)
            .map((item) => Articles.fromJson(item))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dateFin'] = fin;
    data['image'] = image;
    data['dateDebut'] = debut;
    data['libelle'] = libelle;
    data['montantRendu'] = montantRendu;
    data['montant'] = montantJournalier;
    if (categorie != null) {
      data['categorie'] = categorie!.toJson();
    }
    if (article != null) {
      data['articles'] = article!.map((item) => item.toJson()).toList();
    }
    return data;
  }

  double get tauxCotisation {
    if (montantTotal.value > 0) {
      return (montantJournalier!.value / montantTotal!.value);
    } else {
      return 0;
    }
  }
} */
class Carte {
  int? id;
  String? fin;
  //String? image;
  String? debut;
  String? libelle;
  Categorie? categorie;
  double? montantTotal;
  double? montantRendu;
  List<Articles>? articles;
  double? montantJournalier;

  Carte({
    this.id,
    this.fin,
    //this.image,
    this.debut,
    this.articles,
    this.libelle,
    this.categorie,
    this.montantTotal,
    this.montantRendu,
    this.montantJournalier,
  });

  Carte.fromJson(Map<String, dynamic> json) {
    //image = json['image'];
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
    //data['image'] = image;
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

  double get tauxCotisation {
    if (montantTotal.value > 0) {
      return (montantJournalier!.value / montantTotal!.value);
    } else {
      return 0;
    }
  }

  String get image {
    switch (categorie!.libelle) {
      case 'Marché':
        return "assets/images/marche.jpeg";

      case 'Mixte':
        return "assets/images/mixte.jpeg";

      /* case 'Gadget':
        return "assets/images/gadget.jpeg; */
      default:
        return "assets/images/marche.jpeg";
    }
  }
}
