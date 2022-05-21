import 'dart:convert';

import 'package:untitled4/models/Book.dart';
import 'package:untitled4/models/projects.dart';
import 'package:http/http.dart' as http;

class BooksApi {
  static Future<List<Book>> getBooks(String query) async {
    var url = 'http://192.168.1.78/api_dev/api_dev/projects/read1.php';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List books = json.decode(response.body);

      return books.map((json) => Book.fromJson(json)).where((book) {
        final titleLower = book.idspecialization.toString().toLowerCase();
        final authorLower = book.projectName.toString().toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower) ||
            authorLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
