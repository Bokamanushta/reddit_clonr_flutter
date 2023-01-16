import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/core/constants/image_constants.dart';
import 'package:reddit_clone/features/auth/controller/auth_controller.dart';
import 'package:reddit_clone/theme/platter.dart';

class SignInButton extends ConsumerWidget {
  const SignInButton({Key? key}) : super(key: key);

  void signInWithGoogle(WidgetRef ref) {
    ref.read(authControllerProvider).googleSignIn();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
      child: ElevatedButton.icon(
        icon: Image.asset(ImageConstants.googleLogo, height: 25),
        onPressed: () => signInWithGoogle(ref),
        label: const Text(
          'Continue with Google',
          style: TextStyle(color: Pallete.blackColor),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Pallete.whiteColor,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
