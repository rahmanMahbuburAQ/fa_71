import 'dart:convert';
import 'package:fa_71/models/api.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Cart extends ChangeNotifier {
  // List of courses for sale:
  List<Course> courseShop = [];

  // List of items in user's cart:
  List<Course> userCart = [];

  // Fetch dynamic data from API
  Future<void> fetchCourses() async {
    final response = await http.get(Uri.parse('http://192.168.3.189:8000/api/courses/'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      courseShop = data.map((json) => Course.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load courses');
    }
  }

  // Get list of courses for sale
  List<Course> getCourseList() {
    return courseShop;
  }

  // Get cart items
  List<Course> getUserCart() {
    return userCart;
  }

  // Add items to cart
  void addItemToCart(Course course) {
    userCart.add(course);
    notifyListeners();
  }

  // Remove items from cart
  void removeItemFromCart(Course course) {
    userCart.remove(course);
    notifyListeners();
  }
}
