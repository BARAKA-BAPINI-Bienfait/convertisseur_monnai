import 'package:flutter/material.dart';
import '../../../../coeur/constantes/couleurs_app.dart';
import '../page_apropos.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230,
      child: Drawer(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        backgroundColor: Colors.black38,
        child: Column(
          children: [
            SizedBox(
              height: 96,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(
                  16,
                  MediaQuery.of(context).padding.top + 16,
                  16,
                  16,
                ),
                color: CouleursApp.CouleurBleu,
                child: const Text(
                  'OPTIONS',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info, color: CouleursApp.bordureChamp),
              title: const Text(
                'À propos',
                style: TextStyle(color: CouleursApp.fondChamp),
              ),

              //navigation sur autre page
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PageApropos()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
