import 'package:fa_71/models/api.dart';
import 'package:fa_71/pages/bought_course_details_page.dart';
import 'package:flutter/material.dart';

class BoughtCoursesPage extends StatelessWidget {
  final List<Course> boughtCourses;

  const BoughtCoursesPage({Key? key, required this.boughtCourses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bought Courses")),
      body: boughtCourses.isNotEmpty
          ? ListView.builder(
        itemCount: boughtCourses.length,
        itemBuilder: (context, index) {
          final course = boughtCourses[index];
          return GestureDetector(
            onTap: () {
              // Navigate to course details page when tapped
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BoughtCourseDetailsPage(course: course),
                ),
              );
            },
            child: Container(
              // Apply decoration and margin to the Container
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(6),
              ),
              margin: EdgeInsets.only(bottom: 12, left: 15, right: 15),
              child: ListTile(
                leading: course.image != null
                    ? Image.network(
                  course.image!,
                  width: 50, // Set the width of the image
                  height: 50, // Set the height of the image
                  fit: BoxFit.cover, // Adjust the image's fit
                )
                    : Image.asset(
                  'lib/images/profile_default.png', // Fallback if no image is available
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(course.title),
              ),
            ),
          );
        },
      )
          : Center(child: Text('No courses purchased yet.')),
    );
  }
}



