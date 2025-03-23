import 'package:dabata_mobile/models/role.dart';
import 'package:dabata_mobile/tools/extensions/types/map.dart';

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
  String? fcmToken;
  String? sexe;
  String? createdAt;

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
    this.fcmToken,
    this.sexe,
    this.createdAt,
  });

  User.fromJson(Map<String, dynamic> json) {
    //sexe = json['sexe'];
    id = json['id'];
    uuId = json['uuId'];
    nom = json['nom'];
    prenom = json['prenom'];
    email = json['email'];
    fullname = json['fullName'];
    password = json['password'];
    telephone = json['telephone'];
    lieuResidence = json['lieuResidence'];
    sexe = json['sexe'];
    createdAt = json['createdAt'];
    fcmToken = json['fcmToken'];
    if (json['roles'] is List) {
      for (var role in json['roles']) {
        if (role is Map && role.containsKey("libelle")) {
          roles.add(Roles.fromJson(role["libelle"]));
        } else {
          roles.add(Roles.fromJson(role));
        }
      }
    } else if (json['roles'] is Map) {
      for (var role in (json['roles'] as Map).entries) {
        roles.add(Roles.fromJson(role.value));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['nom'] = nom;
    data['prenom'] = prenom;
    data['email'] = email;
    data['password'] = password;
    data['telephone'] = telephone;
    data['lieuResidence'] = lieuResidence;
    return data;
  }

  Json toCache() => {
        'id': id,
        'uuId': uuId,
        'nom': nom,
        'prenom': prenom,
        'email': email,
        'password': password,
        'fullName': fullname,
        'telephone': telephone,
        'lieuResidence': lieuResidence,
        'roles': roles.map((item) => item.toJson()).toList(),
        'fcmToken': fcmToken,
        'sexe': sexe,
        'createdAt': createdAt,
      };

  bool get isAdmin => roles.any((e) => e.libelle == "ROLE_ADMIN");
}
