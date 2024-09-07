import 'package:fa_71/api_services/api_services.dart';
import 'package:flutter/material.dart';


class ApiResponses extends StatelessWidget {
  //const ApiResponses({super.key});


  final ApiService apiService = ApiService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses18'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: apiService.fetchCourses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No courses available'));
          } else {
            // Extract the list of courses from the snapshot
            final courses = snapshot.data!;

            return ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final course = courses[index];
                return ListTile(
                  title: Text(course['Title']),
                  subtitle: Text(course['Details']),
                  // Add other details as needed
                );
              },
            );
          }
        },
      ),
    );
  }
}
