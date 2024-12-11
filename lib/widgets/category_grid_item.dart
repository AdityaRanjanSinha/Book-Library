import 'package:flutter/material.dart';
import 'package:project_intern/models/category.dart';
import 'package:project_intern/enums/genre.dart';

class CategoryGridItem extends StatelessWidget {

  const CategoryGridItem({super.key, required this.category , required this.onSelectCategory});

  final Category category;
  final void Function(Category category) onSelectCategory; 

  String getGenreName(Genre genre) {
    String title = genre.toString().split('.').last;
    return title[0].toUpperCase() + title.substring(1,title.length); 
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("hello world");
        onSelectCategory(category);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          '${getGenreName(category.title)}',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ),
    );
  }
}
