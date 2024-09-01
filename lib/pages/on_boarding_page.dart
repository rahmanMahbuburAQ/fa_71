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
          title: 'First image',
          body: 'This is the first description',
          image: Image.asset(
            'lib/images/first.png',
            width: 150,
          ),
        ),
        PageViewModel(
          title: 'Second image',
          body: 'This is the second description',
          image: Image.asset(
            'lib/images/two.png',
            width: 150,
          ),
        ),
        PageViewModel(
          title: 'Third image',
          body: 'This is the third description',
          image: Image.asset(
            'lib/images/three.jpg',
            width: 150,
          ),
        ),
        PageViewModel(
          title: 'Fourth image',
          body: 'This is the fourth description',
          image: Image.asset(
            'lib/images/two.png',
            width: 150,
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
