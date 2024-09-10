import 'package:fa_71/auth/login_or_register.dart';
import 'package:fa_71/pages/home_page.dart';
import 'package:fa_71/pages/home_page2.dart';
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
              'Welcome to Programming71 app!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          bodyWidget: Padding(
            padding: const EdgeInsets.only(top: 10.0), // Add padding at the top
            child: Column(
              children: [
                Text(
                  "In the dark ages, only those with power or great wealth (and selected experts) possessed reading and writing skills or the ability to acquire them. ",
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(height: 40), // Add spacing between text and image
                ClipRRect(
                  borderRadius: BorderRadius.circular(110.0), // Make the image circular
                  child: Image.asset(
                    'lib/images/python.jpeg',
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
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
                  " It can be argued that literacy of the general population (while still not 100%), together with the invention of printing technology, has been one of the most emancipatory forces of modern history.",
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(height: 40), // Add spacing between text and image
                ClipRRect(
                  borderRadius: BorderRadius.circular(110.0), // Make the image circular
                  child: Image.asset(
                    'lib/images/dart.png',
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
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
                  "while many people nowadays use a computer, few of them are computer programmers. Non-programmers aren't really 'empowered' in how they can use their computer: they are confined to using applications in ways that 'programmers' have determined for them. One doesn't need to be a visionary to see the limitations here.",
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(height: 40), // Add spacing between text and image
                ClipRRect(
                  borderRadius: BorderRadius.circular(110.0), // Make the image circular
                  child: Image.asset(
                    'lib/images/swift.jpg',
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
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
                  "The number of devices that will contain programmable elements is expected to grow dramatically in the coming years. We must learn how to expose this programmability to users in a meaningful way and to make it easy for non-programmers to control and program these devices.",
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(height: 40), // Add spacing between text and image
                ClipRRect(
                  borderRadius: BorderRadius.circular(110.0), // Make the image circular
                  child: Image.asset(
                    'lib/images/js.png',
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ),

      ],
      onDone: () {
        // Navigate to the login page when the onboarding is done
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const LoginOrRegister(),
        //   ),
        // );
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
