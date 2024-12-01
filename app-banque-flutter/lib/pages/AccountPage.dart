import 'package:flutter/material.dart';
import 'package:banking_app/theme/color.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Informations de profil',
          style: TextStyle(color: const Color.fromARGB(255, 65, 72, 51)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profil Section
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.person, size: 80, color:const Color.fromARGB(255, 65, 72, 51)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Salwa Bounajra',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            // Informations personnelles
            Text(
              'Informations personnelles',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Divider(thickness: 1, color: Colors.grey[300]),
            SizedBox(height: 10),
            Text(
              'Adresse : Temara',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 5),
            Text(
              'Code postal : 22000',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 30),
            // Contact
            Text(
              'Contact',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Divider(thickness: 1, color: Colors.grey[300]),
            SizedBox(height: 10),
            Text(
              'Téléphone : 0666666',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 5),
            Text(
              'E-mail : salwa@gmail.com',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
