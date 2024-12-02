import 'package:banking_app/theme/color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: RechargeFormPage(),
  ));
}

class RechargeFormPage extends StatefulWidget {
  const RechargeFormPage({Key? key}) : super(key: key);

  @override
  _RechargeFormPageState createState() => _RechargeFormPageState();
}

class _RechargeFormPageState extends State<RechargeFormPage> {
  final TextEditingController _phoneController = TextEditingController();
  String? _selectedAmount; // Montant sélectionné
  String? _selectedType; // Type sélectionné

  final List<String> amounts = List.generate(10, (index) => '${(index + 1) * 10}'); // De 10 à 100
  final List<String> types = ['Normal', 'Internet', 'International']; // Types

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = primary;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Recharge",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: primaryColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Champ numéro de téléphone
            const Text("Numéro de telephone"),
            const SizedBox(height: 5),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Entrez le numéro de téléphone",
              ),
            ),
            const SizedBox(height: 20),

            // Sélection du montant
            const Text("Montant"),
            const SizedBox(height: 5),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              value: _selectedAmount,
              hint: const Text("Sélectionnez un montant"),
              items: amounts.map((amount) {
                return DropdownMenuItem<String>(
                  value: amount,
                  child: Text("$amount MAD"),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedAmount = value;
                });
              },
            ),
            const SizedBox(height: 20),

            // Sélection du type
            const Text("Type"),
            const SizedBox(height: 5),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              value: _selectedType,
              hint: const Text("Sélectionnez un type"),
              items: types.map((type) {
                return DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedType = value;
                });
              },
            ),
            const SizedBox(height: 30),

            // Bouton Valider
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Vérifier les champs avant de valider
                  if (_phoneController.text.isEmpty ||
                      _selectedAmount == null ||
                      _selectedType == null) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Erreur"),
                        content: const Text(
                            "Veuillez remplir tous les champs avant de valider."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("OK"),
                          ),
                        ],
                      ),
                    );
                  } else {
                    // Affiche un message de confirmation
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Succès"),
                        content: Text(
                            "Recharge effectuée avec succès pour ${_phoneController.text}."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("OK"),
                          ),
                        ],
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
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
                    color: Colors.black,
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
