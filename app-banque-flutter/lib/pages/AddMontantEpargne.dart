import 'package:banking_app/pages/CompteEpargne.dart';
import 'package:banking_app/theme/color.dart';
import 'package:flutter/material.dart';



class AddMontantEpargne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController montantController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Compte d\'épargne'),
        backgroundColor: primary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Redirection vers CompteEpargne
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CompteEpargne()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  'Montant : ',
                  style: TextStyle(fontSize: 18),
                ),
                Expanded(
                  child: TextField(
                    controller: montantController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  'MAD',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Affiche le montant saisi dans la console et redirige
                print('Montant saisi : ${montantController.text}');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CompteEpargne()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primary,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: Text(
                'Valider',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
