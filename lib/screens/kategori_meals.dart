// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:max_mealapp/models/meal.dart';
import 'package:max_mealapp/widgets/meal_item.dart';

import '../dummy_data.dart';

class KategoriMeals extends StatefulWidget {
  final String kategoriID;
  final String kategoriTitle;

  KategoriMeals(this.kategoriID, this.kategoriTitle);

  @override
  State<KategoriMeals> createState() => _KategoriMealsState();
}

class _KategoriMealsState extends State<KategoriMeals> {
  late List<Meal> displayedMeals;
  @override
  void initState() {
    displayedMeals = DUMMY_MEALS.where((meal) {
      return meal.kategori.contains(widget.kategoriID);
    }).toList();
    super.initState();
  }

  void removeMeal(String mealID) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.kategoriTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            displayedMeals[index].id,
            displayedMeals[index].title,
            displayedMeals[index].imageUrl,
            displayedMeals[index].duration,
            displayedMeals[index].complexity,
            displayedMeals[index].affordability,
            removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
