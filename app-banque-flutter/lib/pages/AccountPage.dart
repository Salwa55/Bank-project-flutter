import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:banking_app/theme/color.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text('Informations de profil', style: TextStyle(color: black)),
        backgroundColor: white,
        elevation: 0,
        iconTheme: IconThemeData(color: black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://www.w3schools.com/w3images/avatar2.png'), // Remplacez par l'URL de l'image de profil
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(Ionicons.ios_create, color: primary),
                      onPressed: () {
                        // Ajoutez ici la logique de modification de l'image de profil
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // User Name
            Text(
              'Salwa Bounajra', // Utilisez le nom dynamique ici
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold, color: black),
            ),
            SizedBox(height: 10),
            // User Email
            Text(
              'salwa@example.com', // Utilisez l'email dynamique ici
              style: TextStyle(fontSize: 16, color: grey),
            ),
            SizedBox(height: 30),
            // Action buttons
            ElevatedButton(
              onPressed: () {
                // Logique pour modifier le profil
              },
              child: Text('Modifier le profil'),
              style: ElevatedButton.styleFrom(
                backgroundColor: primary,
                padding: EdgeInsets.symmetric(vertical: 15),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logique pour se déconnecter
              },
              child: Text('Se déconnecter'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 15),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            // Settings Section
            Text(
              'Paramètres',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: black),
            ),
            ListTile(
              leading: Icon(Ionicons.ios_settings, color: primary),
              title: Text('Paramètres du compte'),
              onTap: () {
                // Logique pour les paramètres
              },
            ),
            ListTile(
              leading: Icon(Ionicons.lock_closed, color: primary),
              title: Text('Sécurité'),
              onTap: () {
                // Logique pour les paramètres de sécurité
              },
            ),
          ],
        ),
      ),
    );
  }
}
