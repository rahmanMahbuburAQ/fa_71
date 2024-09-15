import 'dart:async';
import 'package:fa_71/pages/home_page2.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // Import the Lottie package

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  void initState() {
    super.initState();
    // Start a timer that will navigate to another page after 2 seconds
    Timer(Duration(seconds: 5), () {
      // Replace with your desired page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage2()), // Replace with your next page
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
         children:[
            Lottie.network(
              'https://lottie.host/53a1dd10-2613-4c63-8414-2d6b2bdd913f/jclPOgZ7Z9.json',
            ),
          ],
          ),
        ),
    );
  }
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Next Page")),
      body: Center(child: Text("Welcome to the next page!")),
    );
  }
}



