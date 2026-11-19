import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../coeur/constantes/couleurs_app.dart';
import '../../../../coeur/constantes/dimension_app.dart';

class ChampTaux extends StatelessWidget {
  final String titre;
  final TextEditingController controleur;
  final ValueChanged<String>? auChangement;

  const ChampTaux({
    super.key,
    required this.titre,
    required this.controleur,
    this.auChangement,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 70, bottom: 1),
          child: Text(titre, style: const TextStyle(fontSize: 10)),
        ),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 69) +
              const EdgeInsets.only(bottom: 1),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              color: CouleursApp.fondChamp,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    // Hauteur du champ
                    height: DimensionApp.hauteurChamp,
                    alignment: Alignment.center,
                    child: TextField(
                      controller: controleur,
                      onChanged: auChangement,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
                      ],
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontSize: 12),
                      decoration: const InputDecoration(
                        border: InputBorder.none,

                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                      ),
                    ),
                  ),
                  Container(height: 4, color: CouleursApp.bordureChamp),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
