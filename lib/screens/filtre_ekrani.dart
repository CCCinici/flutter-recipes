// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:max_mealapp/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var glutenFree = false;
  var vegetarian = false;
  var vegan = false;
  var lactoseFree = false;

  Widget buildSwitchTile(String title, String aciklama, bool anlikDeger,
      VoidCallback? fonksiyon(bool)) {
    return SwitchListTile(
      title: Text(title),
      value: anlikDeger,
      subtitle: Text(aciklama),
      onChanged: fonksiyon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filtrelemeler"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {},
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Menülerini ayarla.",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchTile(
                  "Vejetaryan",
                  "Sadece vejetaryan tarifler",
                  vegetarian,
                  (yeniDeger) {
                    setState(() {
                      vegetarian = yeniDeger;
                    });
                  },
                ),
                buildSwitchTile(
                  "Vegan",
                  "Sadece vegan tarifler",
                  vegan,
                  (yeniDeger) {
                    setState(() {
                      vegan = yeniDeger;
                    });
                  },
                ),
                buildSwitchTile(
                  "Laktozsuz",
                  "Sadece laktozsuz tarifler",
                  lactoseFree,
                  (yeniDeger) {
                    setState(() {
                      lactoseFree = yeniDeger;
                    });
                  },
                ),
                buildSwitchTile(
                  "Glutensiz",
                  "Sadece glutensiz tarifler",
                  glutenFree,
                  (yeniDeger) {
                    setState(
                      () {
                        glutenFree = yeniDeger;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
