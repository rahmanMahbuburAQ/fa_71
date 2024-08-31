import 'package:fa_71/pages/login_page.dart';
import 'package:fa_71/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //initially show the login page
  bool showLoginPage = true;

  //toggle between login and register page:
  void toggelPages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: toggelPages);
    } else {
      return RegisterPage(onTap: toggelPages);
    }
  }
}