import 'package:fa_71/components/my_button.dart';
import 'package:fa_71/components/my_textfield.dart';
import 'package:fa_71/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Text editing controllers:
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;


  void signUp() async {
    // Check if the passwords match
    if (passwordController.text == confirmPasswordController.text) {
      try {
        // Attempt to create a new user with email and password
        await _auth.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );


        // Display a success message, If registration is successful, show a success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Registration Successful!'),
            backgroundColor: Colors.green, //
            duration: Duration(seconds: 2), // Duration for the snack bar to be visible
          ),
        );

        // Navigate to the HomePage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        // If an error occurs, display the error message
        //ScaffoldMessenger.of(context).showSnackBar(
          //SnackBar(content: Text('Error: ${e.message}')),
        //);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Please create an account first!',
              style: TextStyle(fontSize: 16), // Adjust fontSize as needed
            ),
            backgroundColor: Colors.red, // Optional: change the background color
            duration: Duration(seconds: 3), // Optional: change the duration
          ),
        );


      }
    } else {
      // If passwords do not match, show an error message
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Passwords do not match')),
      // );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Passwords do not match!!!',
            style: TextStyle(fontSize: 16), // Adjust fontSize as needed
          ),
          backgroundColor: Colors.red, // Optional: change the background color
          duration: Duration(seconds: 3), // Optional: change the duration
        ),
      );

    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Icon(
              Icons.add_shopping_cart_sharp,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 30),

            // Message, app slogan
            Text(
              "Let's create an account!",
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            const SizedBox(height: 30),

            // Email textfield
            MyTextField(
              controller: emailController,
              hintText: "Email",
              obscureText: false,
            ),
            const SizedBox(height: 10),

            // Password textfield
            MyTextField(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
            ),
            const SizedBox(height: 10),

            // Confirm password textfield
            MyTextField(
              controller: confirmPasswordController,
              hintText: "Confirm Password",
              obscureText: true,
            ),
            const SizedBox(height: 25),

            // Sign up button
            MyButton(
              text: "Sign Up",
              onTap: ()=> signUp(),
            ),
            const SizedBox(height: 25),

            // Already have an account? Login now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    'Login Now!',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


