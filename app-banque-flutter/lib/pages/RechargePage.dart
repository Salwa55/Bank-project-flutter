import 'package:flutter/material.dart';
import 'VerificationPage.dart'; // Import de la page VerificationPage

void main() {
  runApp(const MaterialApp(
    home: RechargePage(),
  ));
}

class RechargePage extends StatelessWidget {
  const RechargePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color.fromARGB(255, 164, 172, 134); // Vert clair

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          "Recharge",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Liste des opérateurs",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            OperatorTile(
              logo: Icons.wifi, // Icône fictive pour Maroc Telecom
              label: "Maroc Telecom",
              onTap: () {
                // Redirige vers VerificationPage avec valeur = 2
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VerificationPage(valeur: 2),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            OperatorTile(
              logo: Icons.phone, // Icône fictive pour Orange
              label: "Orange",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VerificationPage(valeur: 2),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            OperatorTile(
              logo: Icons.network_check, // Icône fictive pour Inwi
              label: "Inwi",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VerificationPage(valeur: 2),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class OperatorTile extends StatefulWidget {
  final IconData logo;
  final String label;
  final VoidCallback onTap; // Ajout d'une action au clic

  const OperatorTile({
    Key? key,
    required this.logo,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  _OperatorTileState createState() => _OperatorTileState();
}

class _OperatorTileState extends State<OperatorTile> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovering = false;
        });
      },
      child: GestureDetector(
        onTap: widget.onTap, // Action au clic
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: isHovering ? Colors.grey[300] : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              Icon(widget.logo, size: 30, color: Colors.black),
              const SizedBox(width: 20),
              Text(
                widget.label,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
