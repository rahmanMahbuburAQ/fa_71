import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  VideoPlayerScreen({required this.videoUrl});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl)),
    );

    // Enable wakelock to prevent the screen from sleeping while the video is playing
    flickManager.flickVideoManager?.videoPlayerController?.addListener(() {
      if (flickManager.flickVideoManager!.isPlaying) {
        WakelockPlus.enable(); // Prevent screen from sleeping
      } else {
        WakelockPlus.disable(); // Disable wakelock when video is paused or stopped
      }
    });
  }

  @override
  void dispose() {
    flickManager.dispose(); // Dispose of the flickManager to release resources
    WakelockPlus.disable(); // Ensure wakelock is disabled when leaving the screen
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Define your text style for centering the title
    TextStyle center = TextStyle(
      fontSize: 20, // Adjust font size as needed
      fontWeight: FontWeight.bold, // Adjust font weight as needed
      color: Colors.blue, // Set the text color
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Programming71", style: center), // Use the defined text style
        centerTitle: true, // Center the title in the AppBar
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            // Layout for portrait orientation
            return Container(
              height: 300, // Fixed height for portrait mode
              child: FlickVideoPlayer(flickManager: flickManager),
            );
          } else {
            // Layout for landscape orientation
            return Container(
              width: double.infinity, // Full width in landscape
              height: MediaQuery.of(context).size.height, // Full height in landscape
              child: FlickVideoPlayer(flickManager: flickManager),
            );
          }
        },
      ),
    );
  }
}



