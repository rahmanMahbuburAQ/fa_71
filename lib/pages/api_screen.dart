import 'dart:convert';
import 'package:fa_71/models/api.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ApiResponses extends StatefulWidget {
  @override
  _ApiResponsesState createState() => _ApiResponsesState();
}

class _ApiResponsesState extends State<ApiResponses> {
  List<Course> courses = [];

  @override
  void initState() {
    super.initState();
    fetchCourses();
  }

  Future<void> fetchCourses() async {
    final response = await http.get(Uri.parse('http://192.168.3.189:8000/api/courses/'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        courses = data.map((json) => Course.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to load courses');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses'),
      ),
      body: courses.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: courses.length > 2 ? 2 : courses.length, // Limit to 2 items
        itemBuilder: (context, index) {
          final course = courses[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(course.description),
                  SizedBox(height: 10),
                  Text('Price: \$${course.price}'),
                  SizedBox(height: 10),
                  Text('Duration: ${course.duration} weeks'),
                  SizedBox(height: 10),
                  Text('Level: ${course.level}'),
                  SizedBox(height: 10),
                  Text('Language: ${course.language}'),
                  SizedBox(height: 20),
                  // Display instructor details
                  Text(
                    'Instructor: ${course.instructor.name}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(course.instructor.bio),
                  Text('Email: ${course.instructor.email}'),
                  SizedBox(height: 10),
                  Image.network(
                    course.instructor.profileImage.isNotEmpty
                        ? course.instructor.profileImage
                        : 'https://via.placeholder.com/150', // Placeholder image
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.error); // Display an error icon
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}








//http://192.168.3.189:8000/api/reviews/