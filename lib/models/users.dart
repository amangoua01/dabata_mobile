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
    nom = json['nom'];
    uuId = json['uuId'];
    email = json['email'];
    prenom = json['prenom'];
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
    //data['uuId'] = uuId;
    //data['sexe'] = sexe;
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nom'] = nom;
    data['email'] = email;
    data['prenom'] = prenom;
    data['password'] = password;
    data['fullName'] = fullname;
    data['telephone'] = telephone;
    data['lieuResidence'] = lieuResidence;
    data['roles'] = roles.map((item) => item.toJson()).toList();
    return data;
  }

  Json toCache() => {
        'id': id,
        'uuId': uuId,
        'nom': nom,
        'email': email,
        'prenom': prenom,
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
