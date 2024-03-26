import 'package:flutter/material.dart';
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/images.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';

class WaitingScreen extends StatelessWidget {
  final String title;
  const WaitingScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
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
          'Sign Up',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Padding(
        padding: pagePadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: primaryColor),
            ),
            const SizedBox(
              height: 30,
            ),
            Image.asset(Images.waiting_image),
          ],
        ),
      ),
    );
  }
}
