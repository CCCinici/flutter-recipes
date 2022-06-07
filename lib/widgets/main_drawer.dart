// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:max_mealapp/screens/filtre_ekrani.dart';
import 'package:max_mealapp/screens/tabs_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              "Pişir !",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 24,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile("Menüler", Icons.restaurant, () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => TabsScreen(),
              ),
            );
          }),
          buildListTile("Filtrele", Icons.settings, () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => FilterScreen(),
              ),
            );
          }),
        ],
      ),
    );
  }
}
