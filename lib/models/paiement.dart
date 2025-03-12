import 'package:dabata_mobile/models/mode_paiement.dart';

class Paiement {
  int? id;
  double? montant;
  String? datePaiement;
  ModePaiement? modePaiement;

  Paiement({
    this.id,
    this.montant,
    this.datePaiement,
    this.modePaiement,
  });

  factory Paiement.fromJson(Map<String, dynamic> json) {
    return Paiement(
      id: json['id'],
      montant: json['montant'].toDouble(),
      datePaiement: json['datePaiement'],
      modePaiement: ModePaiement.fromJson(json['modePaiement']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'montant': montant,
      'datePaiement': datePaiement,
      'modePaiement': modePaiement!.toJson(),
    };
  }
}
