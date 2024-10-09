import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Django API base URL
  final String baseUrl = 'http://192.168.3.189:8000/api';



  Future<List<dynamic>> fetchCourses() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/reviews/'));

      if (response.statusCode == 200) {
        // Decode the JSON response and return the list of courses
        return json.decode(response.body);
      } else {
        // Handle the error here
        throw Exception('Failed to load courses');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load courses');
    }
  }
}
