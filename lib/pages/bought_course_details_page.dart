import 'package:fa_71/components/video_player_screen.dart';
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
              Text(course.description ?? ''),
              SizedBox(height: 16),
              Text(
                'Course Videos:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
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
              // Add more course details here if needed
            ],
          ),
        ),
      ),
    );
  }
}

