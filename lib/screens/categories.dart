import 'package:flutter/material.dart';
import 'package:project_intern/data/book_data.dart';
import 'package:project_intern/data/category_data.dart';
import 'package:project_intern/models/category.dart';
import 'package:project_intern/widgets/category_grid_item.dart';
import 'package:project_intern/screens/books.dart';
import 'package:project_intern/models/book.dart';
import 'package:project_intern/enums/genre.dart';
import 'package:project_intern/services/gutendex_service.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = false;

  String getGenreName(Genre genre) {
    String title = genre.toString().split('.').last;
    return title[0].toUpperCase() +
        title.substring(1, title.length); 
  }

  final gutendexService = GutendexService();

  void _selectCategory(Category category) async {
    if (books[category.title]!.isEmpty) {
      setState(() {
        _isLoading = true;
      });

      books[category.title] = await gutendexService
          .fetchBooks(category.title.toString().split('.').last);
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => BooksScreen(
          title: getGenreName(category.title),
          books: books[category.title]!,
        ),
      ),
    );

    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _performSearch(String query) async {
    if (query.isEmpty) return;

    setState(() {
      _isLoading = true;
    });

    List<Book> searchResults = await gutendexService.fetchBooks(query);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => BooksScreen(
          title: 'Search Results',
          books: searchResults,
        ),
      ),
    );

    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _isLoading = false;
    });
    _searchController.text = '';
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your Category or Search Books'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                // Search Bar
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: 'Search books by title or author',
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                          onSubmitted: _performSearch,
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () => _performSearch(_searchController.text),
                        child: const Text('Search'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView(
                    padding: const EdgeInsets.all(24),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    children: [
                      for (final category in availableCategories)
                        CategoryGridItem(
                          category: category,
                          onSelectCategory: _selectCategory,
                        ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
