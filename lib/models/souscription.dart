import 'package:dabata_mobile/models/carte.dart';
import 'package:dabata_mobile/models/users.dart';
import 'package:dabata_mobile/tools/constants/etat_souscription.dart';
import 'package:dabata_mobile/tools/extensions/types/double.dart';
import 'package:dabata_mobile/tools/extensions/types/string.dart';

class Souscription {
  int? id;
  int? etat;
  User? user;
  Carte? carte;
  double? montantCotise;
  String? dateLivraison;

  Souscription({
    this.id,
    this.etat,
    this.user,
    this.carte,
    this.montantCotise,
    this.dateLivraison,
  });

  Souscription.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    etat = json['etat'];

    montantCotise = json['montantCotise'].toString().toDouble();

    dateLivraison = json['dateLivraison'];
    user = json['user'] != null
        ? User.fromJson(json['user'] as Map<String, dynamic>)
        : null;
    carte = json['carte'] != null
        ? Carte.fromJson(json['carte'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['id'] = id;
    data['etat'] = etat;
    if (user != null) data['user'] = user!.toJson();
    if (carte != null) data['carte'] = carte!.toJson();
    data['montantCotise'] = montantCotise;
    data['dateLivraison'] = dateLivraison;
    return data;
  }

  EtatSouscription get etatType =>
      EtatSouscription.values.firstWhere((e) => e.code == etat);

  // Méthode pour obtenir le montant restant à cotiser
  double get montantRestant => carte!.montantTotal.value - montantCotise.value;

  double get tauxCotisation {
    if (carte != null) {
      if (carte!.montantTotal.value >= 0 && montantCotise != null) {
        return montantCotise! / carte!.montantTotal.value;
      } else {
        return 0;
      }
    } else {
      return 0.0;
    }
  }
}
