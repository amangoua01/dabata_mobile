import 'package:dabata_mobile/models/users.dart';

class AuthUser {
  String? jwt;
  User? user;

  AuthUser({this.jwt, this.user});

  AuthUser.fromJson(Map<String, dynamic> json) {
    jwt = json['token'];
    user = json['data'] != null ? User.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = jwt;
    data['data'] = user?.toJson();
    return data;
  }
}
