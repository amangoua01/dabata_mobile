import 'package:dabata_mobile/tools/components/functions.dart';
import 'package:dabata_mobile/tools/constants/env.dart';
import 'package:dabata_mobile/tools/extensions/types/string.dart';

extension IntExt on int? {
  int get value => this ?? 0;
  String toAmount({
    String? devise,
    int? decimalDigits,
  }) =>
      Functions.formatMontant(
        toString(),
        devise: devise.defaultValue(Env.defaultDevise.label),
        decimalDigits: decimalDigits,
      );

  bool toBool() => this == 1;
}
