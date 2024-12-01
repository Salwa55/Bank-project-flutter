import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:banking_app/pages/dashboard_page.dart';
import 'package:banking_app/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:banking_app/pages/AccountPage.dart';
import 'package:banking_app/pages/card_page.dart'; // Import de la page CardPage

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: getFooter(),
      body: getBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Naviguer vers CardPage au lieu de changer l'index dans l'IndexedStack
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CardPage()),
          );
        },
        child: Icon(
          AntDesign.creditcard,
          size: 25,
        ),
        backgroundColor: primary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        DashbaordPage(),
        Center(
          child: Text(
            "Chat Page",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text(
            "Notification Page",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: AccountPage(),
        ),
        Center(
          child: Text(
            "Card Page",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      MaterialCommunityIcons.view_grid,
      MaterialCommunityIcons.comment,
      MaterialCommunityIcons.bell,
      MaterialCommunityIcons.account_circle,
    ];

    return AnimatedBottomNavigationBar(
      activeColor: primary,
      splashColor: secondary,
      inactiveColor: Colors.black.withOpacity(0.5),
      icons: iconItems,
      activeIndex: pageIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 10,
      iconSize: 25,
      rightCornerRadius: 10,
      onTap: (index) {
        selectedTab(index);
      },
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
