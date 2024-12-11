import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/book.dart';

class GutendexService {
  static const String baseUrl = 'https://gutendex.com/books';

  Future<List<Book>> fetchBooks(String title) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl?search=$title'));

      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body);

        if (decodedData != null && decodedData['results'] is List) {
          final data = decodedData['results'] as List;

          if (data.isEmpty) {
            return [];
          }
          return data.map((json) => Book.fromJson(json)).toList();
        } else {
          return []; 
        }
      } else {
        throw Exception('Failed to fetch books for genre: $title');
      }
    } catch (e) {
      throw Exception('Error fetching books for $title: $e');
    }
  }
}
