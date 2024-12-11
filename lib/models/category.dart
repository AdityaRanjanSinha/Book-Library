import 'package:flutter/material.dart';
import 'package:project_intern/enums/genre.dart';

class Category{
  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange, 
  });
  final String id;
  final Genre title;
  final Color color;
}