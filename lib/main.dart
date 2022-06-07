// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:max_mealapp/screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filtreler = {
    "gluten": false,
    "laktoz": false,
    "vegan": false,
    "vejetaryan": false,
  };

  void _setfiltre(Map<String, bool> filterData) {}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MenuApp',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: Theme.of(context).textTheme.copyWith(
              bodyText1: TextStyle(
                fontFamily: "RobotoCondensed",
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              bodyText2: TextStyle(
                fontFamily: "Raleway",
                fontSize: 18,
              ),
            ),
      ),
      home: TabsScreen(),
    );
  }
}
