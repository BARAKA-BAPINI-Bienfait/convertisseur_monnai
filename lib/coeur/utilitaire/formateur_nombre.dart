String formaterNombre(double valeur) {
  final parties = valeur.toStringAsFixed(2).split('.');
  final entier = parties[0];
  final decimales = parties[1];

  final tampon = StringBuffer();
  for (var i = 0; i < entier.length; i++) {
    tampon.write(entier[i]);
    final restants = entier.length - i - 1;
    if (restants > 0 && restants % 3 == 0) tampon.write(' ');
  }

  return decimales == '00'
      ? tampon.toString()
      : '${tampon.toString()},$decimales';
}
