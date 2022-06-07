import 'package:flutter/material.dart';

import '../screens/kategori_meals.dart';

class KategoriItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  KategoriItem(this.id, this.title, this.color);

  void secilenKategori(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => KategoriMeals(this.id, this.title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => secilenKategori(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
