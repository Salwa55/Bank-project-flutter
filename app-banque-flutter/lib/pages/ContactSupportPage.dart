import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContactSupportPage(),
    );
  }
}

class ContactSupportPage extends StatelessWidget {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacter support'),
        backgroundColor: Color.fromARGB(255, 164, 172, 134),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            TextField(
              controller: _messageController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Entrer votre message',
              ),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Action du bouton
                final message = _messageController.text;
                if (message.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Message envoyé : $message'),
                    ),
                  );
                  _messageController.clear();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Veuillez entrer un message.'),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 164, 172, 134),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text(
                'Envoyer',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 90), // une hauteur personnalisée
            Text(
              'Ou par e-mail : FSA_support@gmail.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
