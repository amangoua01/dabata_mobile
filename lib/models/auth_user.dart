import 'dart:convert';

import 'package:dabata_mobile/models/users.dart';

class AuthUser {
  String? jwt, refreshToken;
  User? user;

  AuthUser({this.jwt, this.user});

  AuthUser.fromJson(Map<String, dynamic> json) {
    jwt = json['token'];
    refreshToken = json['refresh_token'];
    user = json['data'] != null ? User.fromJson(json['data']) : null;
  }

  String toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = jwt;
    data['refresh_token'] = refreshToken;
    data['data'] = user?.toCache();
    return jsonEncode(data);
  }
}
