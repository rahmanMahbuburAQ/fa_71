import 'package:fa_71/models/api.dart';
import 'package:flutter/material.dart';

class BoughtCourseDetailsPage extends StatelessWidget {
  final Course course;

  const BoughtCourseDetailsPage({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child
          : Scaffold(
        appBar: AppBar(title: Text(course.title)),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              course.image != null
                  ? Image.network(course.image!, height: 200, fit: BoxFit.cover)
                  : Image.asset('lib/images/profile_default.png', height: 200, fit: BoxFit.cover),
              SizedBox(height: 16),
              Text(course.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              Text(course.description),
              // Add other course details if needed
            ],
          ),
        ),
      ),
    );
  }
}
