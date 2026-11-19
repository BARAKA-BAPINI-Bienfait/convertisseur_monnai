import 'package:flutter/foundation.dart';
import '../../donnees/model_resultat.dart';
import '../../donnees/modele_devise.dart';
import '../liste_devises.dart';

class GestionnaireConversion extends ChangeNotifier {
  ResultatConversion? _resultat;
  String? _erreur;

  ResultatConversion? get resultat => _resultat;
  String? get erreur => _erreur;

  void convertir({
    required String montantTexte,
    required String tauxTexte,
    required Devise source,
    required Devise cible,
  }) {
    final montant = _lireNombre(montantTexte);
    final taux = _lireNombre(tauxTexte);

    if (montant == null || montant <= 0) {
      _echec('Entrez un montant valide.');
      return;
    }
    if (taux == null || taux <= 0) {
      _echec('Entrez un taux valide.');
      return;
    }
    _erreur = null;
    _resultat = ResultatConversion(
      montant: montant,
      valeur: _calculer(montant, taux, source, cible), // ← NOUVEAU
      source: source,
      cible: cible,
    );
    notifyListeners();
  }

  // calcul
  double _calculer(double montant, double taux, Devise source, Devise cible) {
    if (source.code == cible.code) {
      return montant; // même devise : rien à convertir
    }
    if (source.code == ListeDevises.cdf.code) {
      return montant / taux; // CDF → USD : on divise
    }
    return montant * taux; // USD → CDF : on multiplie
  }

  void _echec(String message) {
    _erreur = message;
    _resultat = null;
    notifyListeners();
  }

  double? _lireNombre(String texte) {
    return double.tryParse(
      texte.trim().replaceAll(' ', '').replaceAll(',', '.'),
    );
  }
}
