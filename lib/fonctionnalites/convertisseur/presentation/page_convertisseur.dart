import 'package:convertisseur_devise/fonctionnalites/convertisseur/presentation/widgets/bouton_convertir.dart';
import 'package:flutter/material.dart';
import '../../../coeur/constantes/couleurs_app.dart';
import '../donnees/liste_devises.dart';
import '../donnees/modele_devise.dart';
import '../../convertisseur/presentation/widgets/menu_devise.dart';
import '../presentation/widgets/champs_taux.dart';
import '../presentation/widgets/bouton_convertir.dart';
import '../presentation/widgets/carte_resultat.dart';
import '../../convertisseur/donnees/logique/gestionnaire_conversion.dart';
import '../presentation/widgets/menu_lateral.dart';

class PageConvertisseur extends StatefulWidget {
  const PageConvertisseur({super.key});

  @override
  State<PageConvertisseur> createState() => _EtatPageConvertisseur();
}

class _EtatPageConvertisseur extends State<PageConvertisseur> {
  Devise _deviseSource = ListeDevises.usd;
  Devise _deviseCible = ListeDevises.cdf;
  final TextEditingController _controleurTaux = TextEditingController();
  final TextEditingController _controleurMontant = TextEditingController();
  final GestionnaireConversion _gestionnaire = GestionnaireConversion();

  @override
  void dispose() {
    _controleurMontant.dispose();
    _controleurTaux.dispose();
    _gestionnaire.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        //preferredSize: const Size.fromHeight(100),
        preferredSize: const Size.fromHeight(60),
        child: Padding(
          //padding: const EdgeInsets.all(12),
          padding: const EdgeInsets.only(top: 0),

          child: AppBar(
            backgroundColor: CouleursApp.CouleurBleu,

            // le toogle
            leading: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.more_vert, color: Colors.white),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            title: Text("CONVERTISSEUR DE MONNAIE"),
            titleTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFFFFF),
            ),
            centerTitle: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(7)),
            ),
          ),
        ),
      ),

      // le drower
      drawer: const MenuLateral(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(1),

          child: Column(
            children: [
              const SizedBox(height: 10),
              const Text(
                'choisissez la devise',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              MenuDevise(
                titre: 'De',
                valeur: _deviseSource,
                devises: ListeDevises.toutes,
                auChangement: (d) => setState(() => _deviseSource = d),
              ),
              const SizedBox(height: 10),

              MenuDevise(
                titre: 'Vers',
                valeur: _deviseCible,
                devises: ListeDevises.toutes,
                auChangement: (d) => setState(() => _deviseCible = d),
              ),
              const SizedBox(height: 16),

              ChampTaux(
                titre:
                    'Montant en ${_deviseSource.code} = ? ${_deviseCible.code}',
                controleur: _controleurMontant,
              ),

              ChampTaux(
                titre:
                    'Taux : 1 ${_deviseSource.code} = ? ${_deviseCible.code}',
                controleur: _controleurTaux,
              ),
              const SizedBox(height: 30),

              BoutonConvertir(
                auClic: () {
                  FocusScope.of(context).unfocus();
                  _gestionnaire.convertir(
                    montantTexte: _controleurMontant.text,
                    tauxTexte: _controleurTaux.text,
                    source: _deviseSource,
                    cible: _deviseCible,
                  );
                },
              ),
              const SizedBox(height: 24),
              ListenableBuilder(
                listenable: _gestionnaire,
                builder: (context, _) => CarteResultat(
                  resultat: _gestionnaire.resultat,
                  erreur: _gestionnaire.erreur,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
