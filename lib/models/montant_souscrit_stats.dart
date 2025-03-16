class MontantSouscritStats {
  double? montantTotal;
  double? montantPaye;
  double? montantRestant;

  MontantSouscritStats(
      {this.montantTotal, this.montantPaye, this.montantRestant});

  MontantSouscritStats.fromJson(Map<String, dynamic> json) {
    montantTotal = json['montant_total'];
    montantPaye = json['montant_paye'];
    montantRestant = json['montant_restant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['montant_total'] = montantTotal;
    data['montant_paye'] = montantPaye;
    data['montant_restant'] = montantRestant;
    return data;
  }
}
