// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:max_mealapp/models/meal.dart';
import 'package:max_mealapp/screens/meal_detail.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imgUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;

  MealItem(this.id, this.title, this.imgUrl, this.duration, this.complexity,
      this.affordability, this.removeItem);

  void selectMeal(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MealDetail(id),
      ),
    ).then((sonuc) {
      //push metodu geriye pop olana kadar çalışıyor aslında.
      //pop metodundan bu saytafa gelenleri yakalayabilmek için.
      if (sonuc != null) {
        removeItem(sonuc);
      }
    });
  }

  //Bu get metodları buraya gelen değerleri düzenleyip kullanabilmemiz için
  String? get complexityText {
    if (complexity == Complexity.Simple) {
      return "Basit";
    }
    if (complexity == Complexity.Challenging) {
      return "Orta";
    }
    if (complexity == Complexity.Hard) {
      return "Zor";
    }
  }

  String? get affordabilityText {
    if (affordability == Affordability.Affordable) {
      return "Ucuz";
    }
    if (affordability == Affordability.Pricey) {
      return "Makul";
    }
    if (affordability == Affordability.Luxurious) {
      return "Pahalı";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imgUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 200,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.schedule,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text("${duration} dk"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.work,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(complexityText!),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(affordabilityText!),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
