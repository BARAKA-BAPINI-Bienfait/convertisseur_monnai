import 'package:flutter/material.dart';
import '../../../../coeur/constantes/couleurs_app.dart';

class BoutonConvertir extends StatefulWidget {
  final VoidCallback auClic;
  const BoutonConvertir({super.key, required this.auClic});

  @override
  State<BoutonConvertir> createState() => _BoutonConvertirState();
}

class _BoutonConvertirState extends State<BoutonConvertir> {
  bool _enfonce = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _enfonce = true),
      onTapUp: (_) => setState(() => _enfonce = false),
      onTapCancel: () => setState(() => _enfonce = false),
      onTap: widget.auClic,
      child: AnimatedScale(
        scale: _enfonce ? 0.95 : 1.0,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          width: 200,
          height: 56,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: CouleursApp.bordureChamp,
            borderRadius: BorderRadius.circular(11),
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                blurRadius: _enfonce ? 3 : 10,
                offset: Offset(0, _enfonce ? 2 : 6),
              ),
            ],
          ),
          child: const Text(
            'CONVERTIR',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: CouleursApp.fondChamp,
            ),
          ),
        ),
      ),
    );
  }
}
