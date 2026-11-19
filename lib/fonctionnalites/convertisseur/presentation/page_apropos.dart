// import 'package:flutter/material.dart';
// import '../../../coeur/utilitaire/lanceur_externe.dart';
// import '../../../coeur/constantes/couleurs_app.dart';

// class PageApropos extends StatelessWidget {
//   const PageApropos({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Container(
//               height: 56,
//               //margin: const EdgeInsets.fromLTRB(20, 12, 20, 0),
//               margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//               decoration: BoxDecoration(color: CouleursApp.CouleurBleu),
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: IconButton(
//                       icon: const Icon(
//                         Icons.arrow_back_ios_new,
//                         color: Colors.white,
//                         size: 20,
//                       ),
//                       onPressed: () => Navigator.pop(context),
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 48),
//                     child: FittedBox(
//                       fit: BoxFit.scaleDown,
//                       child: Text(
//                         'APROPOS',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             //texte prend tout espace restant , scrol
//             Expanded(
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
//                 child: Text.rich(
//                   const TextSpan(
//                     style: TextStyle(
//                       fontSize: 14,
//                       height: 1.4,
//                       color: Colors.black,
//                     ),
//                     children: [
//                       TextSpan(
//                         text: 'Propriétaire :\n',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       TextSpan(
//                         text:
//                             'Ce petit logiciel de conversion de monnaie a été '
//                             'conçu par le développeur BARAKA BAPINI Bienfait, '
//                             'et il est utilisable uniquement en '
//                             'République démocratique du Congo (RDC).\n\n',
//                       ),
//                       TextSpan(
//                         text: 'Remarque :\n',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       TextSpan(
//                         text:
//                             'Vos remarques et suggestions sont les bienvenues.\n',
//                       ),
//                       TextSpan(
//                         text: 'Contact : ',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       TextSpan(
//                         text:
//                             "Pour plus d'informations, veuillez me contacter "
//                             'au numéro suivant ou par e-mail :\n\n',
//                       ),
//                       TextSpan(text: '0822134415,\n'),
//                       TextSpan(
//                         text: 'bapinibienfait2@gmail.com',
//                         style: TextStyle(decoration: TextDecoration.underline),
//                       ),
//                       TextSpan(text: '.'),
//                     ],
//                   ),
//                 ),
//               ),
//             ),

//             const Padding(
//               padding: EdgeInsets.only(bottom: 16),
//               child: Text(
//                 '@BARAKA BAPINI Bienfait tous droits réservés',
//                 style: TextStyle(fontSize: 13),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../coeur/constantes/couleurs_app.dart';
//import '../../../coeur/utilitaires/lanceur_externe.dart';
import '../../../coeur/utilitaire/lanceur_externe.dart';
import 'package:flutter/services.dart';

class PageApropos extends StatefulWidget {
  const PageApropos({super.key});

  @override
  State<PageApropos> createState() => _EtatPageApropos();
}

class _EtatPageApropos extends State<PageApropos> {
  static const _email = 'bapinibienfait2@gmail.com';
  static const _telephone = '0822134415';
  late final TapGestureRecognizer _clicEmail;
  late final TapGestureRecognizer _clicTelephone;

  @override
  void initState() {
    super.initState();
    _clicEmail = TapGestureRecognizer()..onTap = _ouvrirEmail;
    _clicTelephone = TapGestureRecognizer()..onTap = _appeler;
  }

  @override
  void dispose() {
    _clicEmail.dispose();
    _clicTelephone.dispose();
    super.dispose();
  }

  // fonction pour lancer l'appel
  Future<void> _appeler() async {
    final reussi = await LanceurExterne.appeler(_telephone);
    if (!reussi && mounted) {
      await Clipboard.setData(const ClipboardData(text: _telephone));
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Impossible d'ouvrir le téléphone. Numéro copié."),
        ),
      );
    }
  }

  //fonction pour lancer le email
  Future<void> _ouvrirEmail() async {
    final reussi = await LanceurExterne.envoyerEmail(_email);
    if (!reussi && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Aucune application e-mail trouvée.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 56,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              decoration: BoxDecoration(color: CouleursApp.CouleurBleu),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 48),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'APROPOS',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // texte : prend tout l'espace restant, défilable
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),

                // pour rendre email et  le numero cliquable
                child: Text.rich(
                  TextSpan(
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.4,
                      color: Colors.black,
                    ),
                    children: [
                      const TextSpan(
                        text: 'Propriétaire :\n',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(
                        text:
                            'Ce petit logiciel de conversion de monnaie a été '
                            'conçu par le développeur BARAKA BAPINI Bienfait. ',
                      ),
                      const TextSpan(
                        text: 'Remarque :\n',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(
                        text:
                            'Vos remarques et suggestions sont les bienvenues.\n',
                      ),
                      const TextSpan(
                        text: 'Contact : ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(
                        text:
                            "Pour plus d'informations, veuillez me contacter "
                            'au numéro suivant ou par e-mail :\n\n',
                      ),

                      // le numero cliquable
                      TextSpan(
                        text: _telephone,
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: _clicTelephone,
                      ),

                      const TextSpan(text: ',\n'),
                      TextSpan(
                        text: _email,
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: _clicEmail,
                      ),
                      const TextSpan(text: '.'),
                    ],
                  ),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Text(
                '@BARAKA BAPINI Bienfait tous droits réservés',
                style: TextStyle(fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
