import 'package:url_launcher/url_launcher.dart';

class LanceurExterne {
  static Future<bool> envoyerEmail(String adresse, {String? sujet}) async {
    final texte = sujet == null
        ? 'mailto:$adresse'
        : 'mailto:$adresse?subject=${Uri.encodeComponent(sujet)}';

    try {
      return await launchUrl(Uri.parse(texte));
    } catch (_) {
      return false;
    }
  }

  static Future<bool> appeler(String numero) async {
    final lien = Uri(scheme: 'tel', path: numero);

    try {
      return await launchUrl(lien, mode: LaunchMode.externalApplication);
    } catch (e) {
      debugPrint('Erreur appel : $e');
      return false;
    }
  }

  static void debugPrint(String s) {}
}
