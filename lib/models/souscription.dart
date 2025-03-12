import 'package:dabata_mobile/models/carte.dart';
import 'package:dabata_mobile/models/users.dart';

class Souscription {
  int? id;
  User? user;
  Carte? carte;
  String? dateLivraison;

  Souscription({
    required this.id,
    required this.user,
    required this.carte,
    required this.dateLivraison,
  });

  Souscription.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateLivraison = json['dateLivraison'];
    user = User.fromJson(json['user'] as Map<String, dynamic>);
    carte = Carte.fromJson(json['carte'] as Map<String, dynamic>);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user'] = user!.toJson();
    data['carte'] = carte!.toJson();
    data['dateLivraison'] = dateLivraison;

    return data;
  }
}
