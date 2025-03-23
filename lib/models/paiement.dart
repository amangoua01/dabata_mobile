import 'package:dabata_mobile/models/mode_paiement.dart';
import 'package:dabata_mobile/models/users.dart';
import 'package:dabata_mobile/tools/extensions/types/string.dart';
import 'package:table_calendar/table_calendar.dart';

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

  bool isSameDatePaiement(DateTime date2) {
    var date1 = datePaiement.toDateTime();
    if (date1 != null) {
      return isSameDay(date1, date2);
    } else {
      return false;
    }
  }
}
