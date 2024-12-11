import 'package:project_intern/models/category.dart';
import 'package:flutter/material.dart';
import 'package:project_intern/enums/genre.dart';


const availableCategories = [
  Category(
    id:'c1',
    title: Genre.adventure,
    color: Colors.purple,
  ),
  Category(
    id:'c2',
    title:Genre.mystery,
    color: Colors.red,
  ),
  Category(
    id:'c3',
    title:Genre.fantasy,
    color: Colors.orange,
  ),
  Category(
    id:'c4',
    title:Genre.romance,
    color: Colors.amber,
  ),
  Category(
    id:'c5',
    title:Genre.children,
    color: Colors.blue,
  ),
  Category(
    id:'c6',
    title:Genre.horror,
    color: Colors.green,
  ),
  Category(
    id:'c7',
    title:Genre.history,
    color: Colors.lightBlue,
  ),
  Category(
    id:'c8',
    title:Genre.biographies,
    color: Colors.pink,
  ),

];