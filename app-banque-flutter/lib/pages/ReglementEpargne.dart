import 'package:banking_app/theme/color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ReglementEpargne());
}

class ReglementEpargne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SavingAccountPage(),
      debugShowCheckedModeBanner: false,
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
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fructifiez votre épargne et disposez de votre argent à tout moment',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            SizedBox(height: 16),
            Text(
              'Le compte sur carnet est un compte gratuit et rémunéré qui vous permet d\'épargner de l\'argent dans un compte indépendant de votre compte principal.\n\nL\'épargne constituée peut atteindre jusqu\'à 400 000 Dirhams.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              'Ses avantages ?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            SizedBox(height: 16),
            _buildAdvantageItem(
              'Vous pouvez l\'alimenter en ligne par virement ponctuel ou permanent depuis votre compte courant, ou en espèces dans n\'importe quelle agence Cih Bank.',
            ),
            _buildAdvantageItem(
              'Votre argent reste disponible et vous pouvez le retirer à tout moment.',
            ),
            _buildAdvantageItem(
              'Votre épargne constituée génère une rémunération chaque trimestre, calculée en fonction du montant et de la durée de dépôt à un taux fixé par Bank Al Maghrib.',
            ),
            _buildAdvantageItem(
              'Exclusivement chez Cih Bank, vos opérations sont comptabilisées le jour même de leur exécution, sans date de valeur différente, ce qui vous permet de bénéficier d’une meilleure rémunération.',
            ),
            SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Action à définir pour le bouton
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: Text(
                  'OUVRIR UN COMPTE D\'EPARGNE',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdvantageItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check, color: Colors.green),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
