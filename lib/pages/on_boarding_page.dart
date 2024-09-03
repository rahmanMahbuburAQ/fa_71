import 'package:fa_71/auth/login_or_register.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          titleWidget: Padding(
            padding: const EdgeInsets.only(top: 30.0), // Add padding to the top of the title
            child: Text(
              'Welcome to Cart71 app!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          bodyWidget: Padding(
            padding: const EdgeInsets.only(top: 10.0), // Add padding at the top
            child: Column(
              children: [
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(height: 40), // Add spacing between text and image
                ClipRRect(
                  borderRadius: BorderRadius.circular(110.0), // Make the image circular
                  child: Image.asset(
                    'lib/images/first.png',
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),

        PageViewModel(
          titleWidget: Padding(
            padding: const EdgeInsets.only(top: 30.0), // Add padding to the top of the title
            child: Text(
              'Step: 2',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          bodyWidget: Padding(
            padding: const EdgeInsets.only(top: 10.0), // Add padding at the top
            child: Column(
              children: [
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(height: 40), // Add spacing between text and image
                ClipRRect(
                  borderRadius: BorderRadius.circular(110.0), // Make the image circular
                  child: Image.asset(
                    'lib/images/two.png',
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),

        PageViewModel(
          titleWidget: Padding(
            padding: const EdgeInsets.only(top: 30.0), // Add padding to the top of the title
            child: Text(
              'Step: 3',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          bodyWidget: Padding(
            padding: const EdgeInsets.only(top: 10.0), // Add padding at the top
            child: Column(
              children: [
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(height: 40), // Add spacing between text and image
                ClipRRect(
                  borderRadius: BorderRadius.circular(110.0), // Make the image circular
                  child: Image.asset(
                    'lib/images/three.jpg',
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),

        PageViewModel(
          titleWidget: Padding(
            padding: const EdgeInsets.only(top: 30.0), // Add padding to the top of the title
            child: Text(
              'Step: 4',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          bodyWidget: Padding(
            padding: const EdgeInsets.only(top: 10.0), // Add padding at the top
            child: Column(
              children: [
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(height: 40), // Add spacing between text and image
                ClipRRect(
                  borderRadius: BorderRadius.circular(110.0), // Make the image circular
                  child: Image.asset(
                    'lib/images/first.png',
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),

      ],
      onDone: () {
        // Navigate to the login page when the onboarding is done
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginOrRegister(),
          ),
        );
      },
      showSkipButton: true,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
      //globalBackgroundColor: Colors.red,
      dotsDecorator: DotsDecorator(
        //size: Size(10, 10),
        color: Colors.blueGrey,
        activeColor: Colors.blue,
        activeSize: Size(30, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))
        )
      ),
    );
  }
}
