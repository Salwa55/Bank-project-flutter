import 'package:banking_app/pages/dashboard_page.dart';
import 'package:banking_app/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:banking_app/pages/VerificationPage.dart';


void main() {
  runApp(CompteEpargne());
}

class CompteEpargne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SavingAccountPage(),
    );
  }
}

class SavingAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compte d\'épargne'),
        backgroundColor: primary,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                Text(
                  'Montant : 2000 MAD',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 50),
           ElevatedButton(
              onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(
               builder: (context) => VerificationPage(valeur: 3),
              ),
            );
          },
            style: ElevatedButton.styleFrom(
              backgroundColor: primary, // Couleur de fond du bouton
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: Text(
              'Ajouter Montant',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                onPressed: () {
                  // Navigation vers DashboardPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashbaordPage()),
                  );
                },
                icon: Icon(Icons.home),
                color: Colors.black,
                iconSize: 36,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


