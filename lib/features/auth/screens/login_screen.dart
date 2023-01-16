import 'package:flutter/material.dart';
import 'package:reddit_clone/core/common/sign_in_button.dart';
import 'package:reddit_clone/core/constants/image_constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(ImageConstants.redditLogo, height: 40),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                'Skip',
                style: TextStyle(fontWeight: FontWeight.bold),
              ))
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'Dive into anything',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 0.5),
          ),
          const SizedBox(height: 20),
          Image.asset(ImageConstants.loginImage),
          const SizedBox(height: 20),
          const SignInButton()
        ],
      ),
    );
  }
}
