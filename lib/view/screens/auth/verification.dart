import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';
import 'package:pallets_taxi_driver_pannel/view/base/primary_button.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/location/location.dart';

class VarificationScreen extends StatelessWidget {
  const VarificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        toolbarHeight: kToolbarHeight * 2,
        automaticallyImplyLeading: false,
        leading: FittedBox(
          fit: BoxFit.none,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: borderColor),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: IconButton(
                onPressed: () {
                  pop();
                },
                icon: const Icon(Icons.arrow_back_ios_new_sharp)),
          ),
        ),
        title: Text(
          'Verfy',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Padding(
        padding: pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              child: Text("Phone Varification",
                  style: Theme.of(context).textTheme.headlineMedium),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Enter your OTP code"),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: OTPTextField(
                length: 5,
                width: MediaQuery.of(context).size.width * 0.8,
                fieldWidth: 48,
                style: const TextStyle(fontSize: 17),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                spaceBetween: 5,
                otpFieldStyle: OtpFieldStyle(
                  focusBorderColor: primaryColor,
                ),
                onChanged: (value) {},
                onCompleted: (pin) {},
              ),
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: "Didn't receive code? ",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              TextSpan(
                text: "Resend Again",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: primaryColor),
              ),
            ])),
            SizedBox(
              height: screenHeight * 0.1,
            ),
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                  text: "Verify",
                  onPressed: () => launchScreen(const LocationScreen())),
            ),
          ],
        ),
      ),
    );
  }
}
