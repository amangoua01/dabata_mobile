import 'package:dabata_mobile/models/categorie.dart';
import 'package:dabata_mobile/tools/extensions/types/double.dart';

class Carte {
  int? id;
  String? libelle;
  String? image;
  String? debut;
  String? fin;
  double? montantJournalier, montantTotal;
  Categorie? categorie;

  Carte({
    this.id,
    this.libelle,
    this.image,
    this.debut,
    this.fin,
    this.montantJournalier,
    this.categorie,
    this.montantTotal,
  });

  Carte.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    libelle = json['libelle'];
    image = json['image'];
    debut = json['debut'];
    fin = json['fin'];
    montantJournalier = json['montantJournalier'];
    categorie = json['categorie'] != null
        ? Categorie.fromJson(json['categorie'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['libelle'] = libelle;
    data['image'] = image;
    data['debut'] = debut;
    data['fin'] = fin;
    data['montantJournalier'] = montantJournalier;
    if (categorie != null) {
      data['categorie'] = categorie!.toJson();
    }
    return data;
  }

  double get tauxCotisation {
    if (montantTotal.value > 0) {
      return (montantJournalier!.value / montantTotal.value);
    } else {
      return 0;
    }
  }
}
