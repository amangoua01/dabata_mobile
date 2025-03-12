class Roles {
  String? libelle;

  Roles({this.libelle});

  Roles.fromJson(String data) {
    libelle = data;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['libelle'] = libelle;
    return data;
  }
}
