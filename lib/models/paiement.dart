import 'package:dabata_mobile/models/mode_paiement.dart';
import 'package:dabata_mobile/models/users.dart';

class Paiement {
  int? id;
  User? user;
  double? montant;
  String? datePaiement;
  ModePaiement? modePaiement;

  Paiement({
    this.id,
    this.user,
    this.montant,
    this.datePaiement,
    this.modePaiement,
  });

  factory Paiement.fromJson(Map<String, dynamic> json) {
    return Paiement(
      id: json['id'],
      montant: json['montant'].toDouble(),
      datePaiement: json['datePaiement'],
      user: User.fromJson(json['user']),
      modePaiement: ModePaiement.fromJson(json['modePaiement']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'montant': montant,
      'datePaiement': datePaiement,
      'user': user!.toJson(),
      'modePaiement': modePaiement!.toJson(),
    };
  }
}
