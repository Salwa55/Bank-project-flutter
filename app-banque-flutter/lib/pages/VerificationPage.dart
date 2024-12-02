import 'package:banking_app/pages/RechargeFormPage.dart';
import 'package:banking_app/pages/VirementPage.dart';
import 'package:banking_app/theme/color.dart';
import 'package:flutter/material.dart';

class VerificationPage extends StatelessWidget {
  final int valeur; // Le paramètre que vous souhaitez passer

  // Constructeur qui prend un paramètre 'valeur'
  VerificationPage({Key? key, required this.valeur}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Retourne à la page précédente
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0, // Enlever l'ombre sous l'AppBar
      ),
      body: Stack(
        children: [
          // Contenu principal
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Titre "Verification" placé en haut à gauche
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Vérification",
                      style: TextStyle(
                        fontSize: 20,
                        color: primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Spacer(), // Espace pour descendre les éléments suivants
                // Texte d'instruction au centre
                SizedBox(height: 30),
                // Champ de saisie centré
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 231, 232, 225),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        border: InputBorder.none,
                        hintText: "Veuillez entrez le code",
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Spacer(),
                // Bouton Suivant en bas centré
                Padding(
                  padding: const EdgeInsets.only(bottom: 60),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigation conditionnelle
                      if (valeur == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VirementPage()),
                        );
                      } else  if (valeur == 2) {
                         Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RechargeFormPage()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          primary, // Couleur du bouton
                      foregroundColor: Colors.white, // Couleur du texte
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Suivant",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
