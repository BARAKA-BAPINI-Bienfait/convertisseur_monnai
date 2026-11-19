import 'package:flutter/material.dart';
import '../../donnees/modele_devise.dart';
import '../../../../coeur/constantes/couleurs_app.dart';
import '../../../../coeur/constantes/dimension_app.dart';

class MenuDevise extends StatelessWidget {
  final String titre;
  final Devise valeur;
  final List<Devise> devises;
  final ValueChanged<Devise> auChangement;

  const MenuDevise({
    super.key,
    required this.titre,
    required this.valeur,
    required this.devises,
    required this.auChangement,
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
              child: Container(
                constraints: const BoxConstraints(
                  minHeight: DimensionApp.hauteurChamp,
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<Devise>(
                          value: valeur,
                          isExpanded: true,
                          icon: const Icon(Icons.keyboard_arrow_down, size: 14),
                          dropdownColor: CouleursApp.fondChamp,
                          borderRadius: BorderRadius.circular(8),
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                          ),
                          selectedItemBuilder: (context) => devises
                              .map(
                                (d) => Center(
                                  child: Text(
                                    d.nom,
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              )
                              .toList(),
                          items: devises
                              .map(
                                (d) => DropdownMenuItem(
                                  value: d,
                                  child: Text(
                                    '${d.code}',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (nouvelle) {
                            if (nouvelle != null) auChangement(nouvelle);
                          },
                        ),
                      ),
                    ),
                    Container(height: 4, color: CouleursApp.bordureChamp),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
