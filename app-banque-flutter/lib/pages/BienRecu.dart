import 'package:banking_app/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:banking_app/pages/dashboard_page.dart'; // Import de la page dashboard

void main() {
  runApp(BienRecu());
}

class BienRecu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bien Reçu',
      debugShowCheckedModeBanner: false, // Désactive le bandeau "debug"
      home: BienRecuPage(),
      routes: {
        '/dashboard': (context) => DashbaordPage(),
      },
    );
  }
}

class BienRecuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:primary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Color.fromARGB(255, 164, 172, 134),
              size: 80,
            ),
            SizedBox(height: 10),
            Text(
              'Bien reçu',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/dashboard');
        },
        child: Icon(Icons.home),
        tooltip: 'Aller au Dashboard',
      ),
    );
  }
}
