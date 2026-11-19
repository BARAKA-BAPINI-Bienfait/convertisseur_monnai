import 'package:flutter/material.dart';
import 'coeur/theme/theme_App.dart';
import 'fonctionnalites/convertisseur/presentation/page_convertisseur.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.clair,
      home: const PageConvertisseur(),
    );
  }
}
