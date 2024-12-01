import 'package:flutter/material.dart';

class VerificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                      "Verification",
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 164, 172, 134),
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
                Spacer(flex: 2), // Grand espace avant le bouton
                // Bouton Suivant en bas centré
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: ElevatedButton(
                    onPressed: () {
                      // Action pour le bouton Suivant
                      print("Code soumis");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 164, 172, 134), // Couleur du bouton
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

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: VerificationPage(),
  ));
}
