enum EtatSouscription {
  annulee(1, "ANNULÉE"),
  enCours(2, "EN COURS"),
  soldee(3, "SOLDÉE");

  final int code;
  final String libelle;

  const EtatSouscription(this.code, this.libelle);

  static EtatSouscription fromCode(int code) {
    return EtatSouscription.values.firstWhere(
      (etat) => etat.code == code,
      orElse: () => throw Exception('Code état inconnu: $code'),
    );
  }

  String get displayName => libelle;

  Map<String, dynamic> toJson() => {'code': code, 'libelle': libelle};
}
