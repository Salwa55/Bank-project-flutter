import 'package:banking_app/pages/BienRecu.dart';
import 'package:banking_app/theme/color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: VirementPage(),
  ));
}

class VirementPage extends StatelessWidget {
  const VirementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Couleur personnalisée pour le bouton et le titre
    final Color primaryColor =primary; 

    return Scaffold(
      appBar: AppBar(
        title: const Text("Virement"),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            const SizedBox(height: 20),
            // Champ pour le bénéficiaire
            TextField(
              decoration: const InputDecoration(
                labelText: "Bénéficiaire",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            // Champ pour le montant
            TextField(
              decoration: const InputDecoration(
                labelText: "Montant",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            // Champ pour le motif
            TextField(
              decoration: const InputDecoration(
                labelText: "Motif",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            // Bouton Valider
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BienRecu()),
                        );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor, // Couleur de fond du bouton
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Valider",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Couleur du texte
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
