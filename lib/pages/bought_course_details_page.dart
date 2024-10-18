import 'package:fa_71/models/api.dart';
import 'package:flutter/material.dart';

class BoughtCourseDetailsPage extends StatelessWidget {
  final Course course;

  const BoughtCourseDetailsPage({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(course.title)),
      body: SingleChildScrollView( // Wrap content in a scrollable widget if it might exceed screen size
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              course.image != null
                  ? Container(
                height: 200, // Constrain the image size to prevent infinite height
                width: double.infinity, // Take full width
                child: Image.network(
                  course.image!,
                  fit: BoxFit.cover,
                ),
              )
                  : SizedBox(
                height: 200,
                width: double.infinity,
                child: Image.asset('lib/images/profile_default.png', fit: BoxFit.cover),
              ),
              SizedBox(height: 16),
              Text(
                course.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(course.description),
              // Add more course details here if needed
            ],
          ),
        ),
      ),
    );
  }
}

