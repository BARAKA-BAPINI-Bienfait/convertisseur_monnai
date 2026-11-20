import 'package:flutter/material.dart';
import '../constantes/couleurs_app.dart';

class ThemeApp {
  static ThemeData get clair {
    return ThemeData(
      fontFamily: 'Inter',
      scaffoldBackgroundColor: CouleursApp.CouleurPrincipal,
      //colorScheme: ColorScheme.fromSeed(seedColor: CouleursApp.CouleurPrincipal),
    );
  }
}
