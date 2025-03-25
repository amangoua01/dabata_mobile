import 'package:dabata_mobile/models/currency.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Env {
  static const defaultDevise = Currency("Fcfa", code: "XOF");
  static const appName = "Dabata";
  static const appVersion = "1.0.0";
  static final defaultFont = GoogleFonts.poppins().fontFamily;

  static String sentryDsn = "";
}
