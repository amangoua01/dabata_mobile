import 'dart:convert';

import 'package:dabata_mobile/tools/components/functions.dart';
import 'package:dabata_mobile/tools/constants/env.dart';
import 'package:dabata_mobile/tools/extensions/types/models/replace_item.dart';

extension StringExt on String? {
  String get value => this ?? "";

  bool get isNotEmpty => this != null && this!.isNotEmpty;

  bool get isEmpty => this == null || this!.isEmpty;

  DateTime? toDateTime() => DateTime.tryParse(toString());

  int? toInt() => int.tryParse(toString());

  double? toDouble() => double.tryParse(toString());

  String get toFrenchDateTime => (this != null)
      ? Functions.getStringDate(toDateTime(), withTime: true)
      : "";

  String get toTime => (this != null) ? Functions.getTime(toDateTime()) : "";

  String get toFrenchDate =>
      (this != null) ? Functions.getStringDate(toDateTime()) : "";

  int? fromAmountToInt() {
    if (this == null) {
      return null;
    } else {
      var val = this!.replaceAll(RegExp(r'[^0-9-]'), '');
      return int.tryParse(val);
    }
  }

  double? fromAmountToDouble() {
    if (this == null) {
      return null;
    } else {
      var val = this!.replaceAll(RegExp(r'\s'), '');
      return double.tryParse(val);
    }
  }

  bool get isJson {
    if (this == null) {
      return false;
    } else {
      try {
        json.decode(this!);
        return true;
      } catch (e) {
        return false;
      }
    }
  }

  String toAmount({
    String? devise,
    int? decimalDigits,
  }) =>
      Functions.formatMontant(
        this,
        devise: devise.defaultValue(Env.defaultDevise.label),
        decimalDigits: decimalDigits,
      );

  String defaultValue(String value) {
    return this ?? value;
  }

  String? replaceFromList(List<ReplaceItem> list) {
    if (this == null) {
      return null;
    } else {
      var res = this!;
      for (var e in list) {
        res = res.replaceAll(e.from, e.to);
      }
      return res;
    }
  }
}
