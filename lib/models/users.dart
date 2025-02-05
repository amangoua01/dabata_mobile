import 'package:dabata_mobile/models/role.dart';

class User {
  int? id;
  String? uuId;
  String? email;
  String? nom;
  String? prenom;
  String? fullname;
  String? telephone;
  List<Roles> roles = [];
  String? sexe;
  String? lieuResidence;

  User(
      {this.id,
      this.uuId,
      this.email,
      this.nom,
      this.prenom,
      this.fullname,
      this.telephone,
      this.roles = const [],
      this.sexe,
      this.lieuResidence});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuId = json['uuId'];
    email = json['email'];
    nom = json['nom'];
    prenom = json['prenom'];
    fullname = json['fullname'];
    telephone = json['telephone'];
    if (json['roles'] != null) {
      for (var role in (json['roles'] as Map).entries) {
        roles.add(Roles.fromJson(role.value));
      }
    }
    sexe = json['sexe'];
    lieuResidence = json['lieuResidence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uuId'] = uuId;
    data['email'] = email;
    data['nom'] = nom;
    data['prenom'] = prenom;
    data['fullname'] = fullname;
    data['telephone'] = telephone;
    data['sexe'] = sexe;
    data['lieuResidence'] = lieuResidence;
    return data;
  }
}
