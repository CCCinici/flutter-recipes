import 'package:flutter/material.dart';

class Kategori {
  final String id;
  final String title;
  final Color color;

  const Kategori(
      {required this.id, required this.title, this.color = Colors.orange});
}
