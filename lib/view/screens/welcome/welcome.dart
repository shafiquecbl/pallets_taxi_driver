import 'package:flutter/material.dart';
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';
import 'package:pallets_taxi_driver_pannel/utils/images.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';
import 'package:pallets_taxi_driver_pannel/view/base/primary_button.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/auth/signin.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/auth/signup.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: pagePadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(Images.welcomeImage),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                text: "Create an account",
                onPressed: () => launchScreen(const SignUpScreen()),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                width: double.infinity,
                child: PrimaryOutlineButton(
                    text: "Log In",
                    onPressed: () => launchScreen(const SignInScreen()))),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
