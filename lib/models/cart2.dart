import 'dart:convert';
import 'package:fa_71/models/api.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Cart extends ChangeNotifier {
  // List of courses for sale
  List<Course> courseShop = [];

  // List of items in user's cart
  List<Course> userCart = [];

  // Set of added course IDs to disable the '+' button once a course is added
  Set<int> _addedCourseIds = {};

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

  // Check if a course is already added to the cart
  bool isCourseAdded(int courseId) {
    return _addedCourseIds.contains(courseId);
  }

  // Add items to cart and disable '+' button for that course
  void addItemToCart(Course course) {
    if (!_addedCourseIds.contains(course.id)) {
      userCart.add(course);
      _addedCourseIds.add(course.id); // Mark this course as added
      notifyListeners();
    }
  }

  // Remove items from cart and re-enable the '+' button for that course
  void removeItemFromCart(Course course) {
    userCart.remove(course);
    _addedCourseIds.remove(course.id); // Remove from added set
    notifyListeners();
  }
}

