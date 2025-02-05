class Roles {
  String? libelle;

  Roles({this.libelle});

  Roles.fromJson(String data) {
    libelle = data;
  }
}
