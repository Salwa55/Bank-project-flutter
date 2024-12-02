import 'package:banking_app/data_json/card_json.dart';
import 'package:banking_app/data_json/card_operations_json.dart';
import 'package:banking_app/pages/RechargePage.dart';
import 'package:banking_app/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:banking_app/pages/VerificationPage.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  int selectedTab = 0; // 0 pour "Opérations", 1 pour "Historique"

  // Données simulées pour l'historique
  List<Map<String, String>> historyData = [
    {'montant': '-100', 'motif': 'Virement'},
    {'montant': '+50', 'motif': 'Réception'},
    {'montant': '-200', 'motif': 'Paiement'},
    {'montant': '+150', 'motif': 'Virement reçu'},
    {'montant': '-75', 'motif': 'Achat en ligne'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar:
          PreferredSize(child: getAppBar(), preferredSize: Size.fromHeight(60)),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: white,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: black,
            size: 22,
          )),
      title: Text(
        "Card",
        style: TextStyle(fontSize: 18, color: black),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert, color: black, size: 25))
      ],
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    final PageController controller = PageController();
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 240,
            child: PageView(
              controller: controller,
              children: List.generate(cardLists.length, (index) {
                return getCards(
                  cardLists[index]['amount'],
                  cardLists[index]['currency'],
                  cardLists[index]['card_number'],
                  cardLists[index]['valid_date'],
                  cardLists[index]['bg_color'],
                );
              }),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: grey.withOpacity(0.1),
                  spreadRadius: 10,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedTab = 0; // Activer "Opérations"
                            });
                          },
                          child: Container(
                            width: size.width / 2,
                            height: 55,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: selectedTab == 0
                                            ? primary
                                            : black.withOpacity(0.05),
                                        width: selectedTab == 0 ? 3.5 : 1))),
                            child: Center(
                              child: Text(
                                "Opérations",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: selectedTab == 0
                                        ? primary
                                        : primary.withOpacity(0.5),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedTab = 1; // Activer "Historique"
                            });
                          },
                          child: Container(
                            width: size.width / 2,
                            height: 55,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: selectedTab == 1
                                            ? primary
                                            : black.withOpacity(0.05),
                                        width: selectedTab == 1 ? 3.5 : 1))),
                            child: Center(
                              child: Text(
                                "Historique",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: selectedTab == 1
                                        ? primary
                                        : primary.withOpacity(0.5),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Affichage selon l'onglet sélectionné
                selectedTab == 0
                    ? Column(
                        children: List.generate(cardOperations.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 20),
                            child: GestureDetector(
                              onTap: () {
                                if (cardOperations[index]['title'] ==
                                    "Virement") {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          VerificationPage(valeur: 1),
                                    ),
                                  );
                                } else if (cardOperations[index]['title'] ==
                                    "Effectuer une recharge") {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => RechargePage(),
                                    ),
                                  );
                                } else {
                                  print(
                                      "Autre opération : ${cardOperations[index]['title']}");
                                }
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: grey.withOpacity(0.1),
                                      spreadRadius: 10,
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: secondary.withOpacity(0.3),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Center(
                                          child: Icon(
                                            cardOperations[index]['icon'],
                                            color: primary,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        cardOperations[index]['title'],
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      )
                    : Column(
                        children: List.generate(historyData.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Montant
                                Text(
                                  historyData[index]['montant']!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: historyData[index]['montant']!
                                            .startsWith('-')
                                        ? Colors.red
                                        : Colors.green,
                                  ),
                                ),
                                // Motif
                                Text(
                                  historyData[index]['motif']!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getCards(amount, currency, cardNumber, validDate, bgColor) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                currency,
                style: TextStyle(
                    fontSize: 17, color: black, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              amount,
              style: TextStyle(
                  fontSize: 35, color: black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: size.width * 0.85,
          height: 170,
          decoration: BoxDecoration(
              color: bgColor, borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "**** **** **** $cardNumber",
                      style: TextStyle(
                          fontSize: 20,
                          color: white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "VALID THRU",
                      style: TextStyle(fontSize: 13, color: white),
                    ),
                    Text(
                      validDate,
                      style: TextStyle(fontSize: 13, color: white),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
