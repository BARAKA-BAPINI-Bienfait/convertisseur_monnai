import 'modele_devise.dart';

class ResultatConversion {
  final double montant;
  final double valeur;
  final Devise source;
  final Devise cible;

  const ResultatConversion({
    required this.montant,
    required this.valeur,
    required this.source,
    required this.cible,
  });
}
