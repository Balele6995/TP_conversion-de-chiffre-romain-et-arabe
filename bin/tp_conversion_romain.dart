import 'dart:io';

void main() {
  bool continuer = true;
  print("===== CONVERTISSEUR ARABE / ROMAIN =====");
// Boucle principal continue tanque l'utilisateur ne choisit pas
  while (continuer) {

    print("\n \x1B[34m CHOISSISSEZ UNE OPTION \x1b[0m :");
    print("A) Conversion Arabe -> Romain");
    print("B) conversion Romain -> Arabe");
    stdout.write("choississez le type de conversion  : ");
    String? choix = stdin.readLineSync();
    // utilisation de switch pour faire un choix
    switch (choix) {

      case "1":// demande a l' utilisateur d'entrer un nombre arabe
        stdout.write("Entrez un nombre arabe : ");
        int? nombre = int.tryParse(stdin.readLineSync() ?? "");
        if (nombre != null) {
          String resultat = arabeversRomain(nombre);
          print("Résultat : $resultat");
        } else {
          print("Entrée invalide.");
        } break;

      case "2": // demande a l'utilisateur de tapez un nombre Romain
        stdout.write("Entrez un nombre romain : ");
        String? romain = stdin.readLineSync();

        if (romain != null && romain.isNotEmpty) {
          int resultat = romainVersArabe(romain.toUpperCase());
          print("Résultat : $resultat");
        } else {
          print("Entrée invalide.");
        }
        break;

      case "0":
        continuer = false;
        print("Fin du programme.");
        break;

      default:
        print("\x1B[31m Choix incorrect, réessayez  \x1b[0m.");
    }
  }
}

// 🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎
//  Fonction 1 : Arabe -> Romain
// 🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎

String arabeversRomain(int nombre) {
  List<int> valeurs = [
    1000, 900, 500, 400, 100, 90, 50, 40,
    10, 9, 5, 4, 1
  ];
  List<String> symboles = [
    "M", "CM", "D", "CD", "C", "XC", "L", "XL",
    "X", "IX", "V", "IV", "I"
  ];
  String resultat = "";
  for (int i = 0; i < valeurs.length; i++) {
    while (nombre >= valeurs[i]) {
      resultat += symboles[i];
      nombre -= valeurs[i];
    }
  } return resultat;
}

// ⚽⚽⚽⚽⚽⚽⚽⚽⚽⚽⚽⚽⚽⚽⚽⚽⚽⚽⚽⚽⚽⚽
//  Fonction 2 : Romain -> Arabe
// ⚽⚽⚽⚽⚽⚽⚽⚽⚽⚽⚽⚽⚽⚽⚽⚽⚽⚽⚽⚽⚽⚽

int romainVersArabe(String romain) {
  Map<String, int> valeurs = {
    "I": 1,"V": 5,"X": 10,"L": 50,"C": 100,"D": 500,"M": 1000
  };
  int total = 0;
  for (int i = 0; i < romain.length; i++) {

    int valeurActuelle = valeurs[romain[i]] ?? 0;
    int valeurSuivante = 0;

    if (i + 1 < romain.length) {
      valeurSuivante = valeurs[romain[i + 1]] ?? 0;
    }

    if (valeurActuelle < valeurSuivante) {
      total -= valeurActuelle;
    } else {
      total += valeurActuelle;
    }
  } return total;
}