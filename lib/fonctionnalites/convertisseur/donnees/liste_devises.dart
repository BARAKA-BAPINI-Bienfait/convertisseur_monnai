import 'modele_devise.dart';

class ListeDevises {
  static const usd = Devise(
    code: 'USD',
    nom: 'Dollar américain',
    symbole: '\$',
  );

  static const cdf = Devise(
    code: 'CDF', 
    nom: 'Franc congolais', 
    symbole: 'FC'
    );

  static const toutes = [usd, cdf];
}
