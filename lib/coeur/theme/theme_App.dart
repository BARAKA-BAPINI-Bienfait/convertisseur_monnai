import 'package:flutter/material.dart';
import '../constantes/couleurs_app.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeApp {
  static ThemeData get clair{
    return ThemeData(
      //colorScheme: ColorScheme.fromSeed(seedColor: CouleursApp.CouleurPrincipal),
      scaffoldBackgroundColor: CouleursApp.CouleurPrincipal,
      textTheme: GoogleFonts.interTextTheme(), 
    );
  }

}