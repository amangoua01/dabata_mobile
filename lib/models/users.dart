import 'package:dabata_mobile/models/role.dart';

class User {
  int? id;
  String? nom;
  String? uuId;
  String? email;
  String? prenom;
  String? fullname;
  String? password;
  String? telephone;
  String? lieuResidence;
  List<Roles> roles = [];
  //String? sexe;

  User({
    this.id,
    this.nom,
    this.uuId,
    this.email,
    this.prenom,
    this.fullname,
    this.password,
    this.telephone,
    this.lieuResidence,
    this.roles = const [],
    //this.sexe,
  });

  User.fromJson(Map<String, dynamic> json) {
    //sexe = json['sexe'];
    id = json['id'];
    nom = json['nom'];
    uuId = json['uuId'];
    email = json['email'];
    prenom = json['prenom'];
    fullname = json['fullName'];
    password = json['password'];
    telephone = json['telephone'];
    lieuResidence = json['lieuResidence'];
    if (json['roles'] != null) {
      if (json['roles'] is List) {
        for (var role in json['roles']) {
          roles.add(Roles.fromJson(role));
        }
      } else if (json['roles'] is Map) {
        for (var role in (json['roles'] as Map).entries) {
          roles.add(Roles.fromJson(role.value));
        }
      }
    }
  }

  Map<String, dynamic> toJson() {
    //data['uuId'] = uuId;
    //data['sexe'] = sexe;
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nom'] = nom;
    data['email'] = email;
    data['prenom'] = prenom;
    data['password'] = password;
    data['fullname'] = fullname;
    data['telephone'] = telephone;
    data['lieuResidence'] = lieuResidence;
    data['roles'] = roles.map((item) => item.toJson()).toList();
    return data;
  }
}
