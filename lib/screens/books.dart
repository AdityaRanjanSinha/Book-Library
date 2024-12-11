import 'package:flutter/material.dart';
import 'package:project_intern/models/book.dart';
import 'package:project_intern/screens/book_details.dart';
import 'package:project_intern/widgets/book_item.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key, required this.title, required this.books});

  final String title;
  final List<Book> books; 

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  static const int _initialLoadCount = 10;
  List<Book> _visibleBooks = [];
  bool _isLoadingMore = false;

  void onSelectBook(Book book) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => (BookDetailsScreen(book: book)),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadInitialBooks();
  }

  void _loadInitialBooks() {
    setState(() {
      _visibleBooks = widget.books.take(_initialLoadCount).toList();
    });
  }

  Future<void> _loadMoreBooks() async {
    if (_isLoadingMore || _visibleBooks.length >= widget.books.length) {
      return; 
    }
    setState(() {
      _isLoadingMore = true;
    });

    await Future.delayed(
        const Duration(seconds: 2)); 

    final newBooks = widget.books
        .skip(_visibleBooks.length)
        .take(_initialLoadCount)
        .toList();
    setState(() {
      _visibleBooks.addAll(newBooks);
      _isLoadingMore = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: widget.books.isEmpty
          ? const Center(
              child: Text(
                'No results. Search for other books.',
                style: TextStyle(
                  fontSize: 18, 
                  fontWeight: FontWeight.bold,
                  color: Colors.white, 
                ),
              ),
            )
          : NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification.metrics.pixels ==
                    scrollNotification.metrics.maxScrollExtent) {
                  _loadMoreBooks();
                }
                return false;
              },
              child: ListView.builder(
                itemCount: _visibleBooks.length + (_isLoadingMore ? 1 : 0),
                itemBuilder: (ctx, index) {
                  if (index == _visibleBooks.length) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return BookItem(book: _visibleBooks[index], onSelectBook: onSelectBook);
                },
              ),
            ),
    );
  }
}
