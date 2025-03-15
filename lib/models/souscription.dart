import 'package:dabata_mobile/models/carte.dart';
import 'package:dabata_mobile/models/users.dart';
import 'package:dabata_mobile/tools/constants/etat_souscription.dart';

class Souscription {
  int? id;
  int? etat;
  User? user;
  Carte? carte;
  String? dateLivraison;

  Souscription({
    required this.id,
    required this.etat,
    required this.user,
    required this.carte,
    required this.dateLivraison,
  });

  Souscription.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    etat = json['etat'];
    dateLivraison = json['dateLivraison'];
    user = User.fromJson(json['user'] as Map<String, dynamic>);
    carte = Carte.fromJson(json['carte'] as Map<String, dynamic>);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['etat'] = etat;
    data['user'] = user!.toJson();
    data['carte'] = carte!.toJson();
    data['dateLivraison'] = dateLivraison;

    return data;
  }

  EtatSouscription get operatorType =>
      EtatSouscription.values.firstWhere((e) => e.code == etat);
}
