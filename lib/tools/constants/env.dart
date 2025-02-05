import 'package:dabata_mobile/models/currency.dart';

abstract class Env {
  static const defaultDevise = Currency("Fcfa", code: "XOF");
  static const appName = "Dabata";
  static const appVersion = "1.0.0";
}
