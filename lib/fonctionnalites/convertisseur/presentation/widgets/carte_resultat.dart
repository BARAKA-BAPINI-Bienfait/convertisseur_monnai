import 'package:flutter/material.dart';
import '../../../../coeur/utilitaire/formateur_nombre.dart';
import '../../donnees/model_resultat.dart';

class CarteResultat extends StatelessWidget {
  final ResultatConversion? resultat;
  final String? erreur;
  const CarteResultat({super.key, this.resultat, this.erreur});

  @override
  Widget build(BuildContext context) {
    Widget contenu = const SizedBox.shrink(key: ValueKey('vide'));

    if (erreur != null) {
      contenu = Text(
        erreur!,
        key: ValueKey(erreur),
        style: const TextStyle(
          color: Color.fromARGB(255, 177, 94, 88),
          fontSize: 16,
        ),
      );
    } else if (resultat != null) {
      final r = resultat!;
      contenu = Column(
        key: ValueKey(r),
        children: [
          Text(
            '${formaterNombre(r.montant)} ${r.source.code} =',
            style: const TextStyle(fontSize: 10, color: Colors.black54),
          ),

          //const SizedBox(height: 1),
          Text(
            '${formaterNombre(r.valeur)} ${r.cible.code}',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ],
      );
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 350),
      transitionBuilder: (enfant, animation) {
        final glissement = Tween<Offset>(
          begin: const Offset(0, 0.3),
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut));

        return FadeTransition(
          opacity: animation,
          child: SlideTransition(position: glissement, child: enfant),
        );
      },
      child: contenu,
    );
  }
}
