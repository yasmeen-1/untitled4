import 'dart:convert';

import 'package:untitled4/models/ACC.dart';
import 'package:http/http.dart' as http;

class AccApi {
  static Future<List<ACC>> getAcc(String query) async {
    var url = 'http://192.168.1.78/api_dev/api_dev/project/read1.php';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List Acc = json.decode(response.body);

      return Acc.map((json) => ACC.fromJson(json)).where((book) {
        final titleLower = book.projectDescription.toString().toLowerCase();
        final authorLower = book.projectDescription.toString().toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower) ||
            authorLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
