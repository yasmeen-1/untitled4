import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled4/models/apply.dart';

class Ussapi {
  static Future<List<ProjectApplies>> getapplyrate(String query) async {
    var url = 'http://192.168.1.78/api_dev/api_dev/projectsapplies/read1.php';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List rats = json.decode(response.body);

      return rats.map((json) => ProjectApplies.fromJson(json)).where((rates) {
        final titleLower = rates.userRate.toString().toLowerCase();
        // final authorLower = rates.userRate.toString().toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
