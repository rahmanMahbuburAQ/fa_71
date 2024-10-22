import 'package:fa_71/components/video_player_screen.dart';
import 'package:flutter/material.dart';
import 'package:fa_71/models/api.dart'; // Import your course model

class CourseDetailScreen extends StatelessWidget {
  final Course course; // Pass the course data to this screen

  CourseDetailScreen({required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.title), // Use the course title in the AppBar
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display the course image
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: course.image != null
                    ? Image.network(
                  course.image!,
                  fit: BoxFit.cover,
                )
                    : Image.asset(
                  'lib/images/default.png', // Placeholder image
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              // Display course description
              Text(
                course.description ?? '',
                style: TextStyle(fontSize: 13),
              ),
              SizedBox(height: 20),
              Text(
                'Course Level: ' + course.level,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'Language: ' + course.language,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'Instructor Name: ' + course.instructor.name,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              CircleAvatar(
                radius: 25, // Size of the avatar
                backgroundImage: course.instructor.profile_image != null && course.instructor.profile_image!.isNotEmpty
                    ? NetworkImage(course.instructor.profile_image!) // Dynamic image from API or database
                    : AssetImage('lib/images/default.png') as ImageProvider, // Placeholder image
                backgroundColor: Colors.grey[500], // Background color for missing image
              ),
              SizedBox(height: 20),
              Text(
                'Instructor Contact: ' + course.instructor.email,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Instructor Bio: ' + course.instructor.bio,
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 20),
              Text(
                'Course Sample Videos:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // Use a SizedBox to constrain the height
              SizedBox(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(), // Disable scrolling in ListView
                  itemCount: course.freeVideos?.length ?? 0,
                  itemBuilder: (context, index) {
                    final videoUrl = course.freeVideos?[index];

                    if (videoUrl != null && videoUrl.isNotEmpty) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 4.0), // Margin between items
                        decoration: BoxDecoration(
                          color: Colors.blue[100], // Background color
                          border: Border.all(color: Colors.blue, width: 1), // Border color and width
                          borderRadius: BorderRadius.circular(8.0), // Rounded corners
                        ),
                        child: ListTile(
                          //title: Text('Video ${index + 1}'),
                          subtitle: Text(videoUrl),
                          onTap: () {
                            // Navigate to VideoPlayerScreen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VideoPlayerScreen(videoUrl: videoUrl),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return Container(); // Empty container for null or empty videoUrl
                    }
                  },
                ),
              ),
              SizedBox(height: 20),
              Text(
                  'Course Fee: ￥' + double.parse(course.price).toStringAsFixed(0),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              // List of Free Videos
            ],
          ),
        ),
      ),
    );
  }
}


