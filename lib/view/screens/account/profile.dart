import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pallets_taxi_driver_pannel/common/buttons.dart';
import 'package:pallets_taxi_driver_pannel/common/network_image.dart';
import 'package:pallets_taxi_driver_pannel/common/textfield.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/images.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';
import 'package:pallets_taxi_driver_pannel/view/base/primary_button.dart';
import 'package:pallets_taxi_driver_pannel/view/base/rating_bar.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/auth/signup.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text('Profile'),
      ),
      body: Form(
        child: ListView(
          padding: pagePadding,
          children: [
            Center(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: const SizedBox(
                      height: 125,
                      width: 125,
                      child: CustomNetworkImage(
                        url: Images.user_placeholder,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 18,
                      child: IconButton.filled(
                        onPressed: () {},
                        icon: Image.asset(Images.replace_icon),
                        color: primaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 15.sp),

            /// name
            Center(
              child: Text("Nate Samson",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Colors.black54)),
            ),

            SizedBox(height: 40.sp),

            /// sign up form
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.sp),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: borderColor)),
              child: Row(
                children: [
                  Text(
                    "Ratings: ",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const CustomRatingBar(rating: 4.5),
                  const Spacer(),
                  const Text("4.5 (20+)"),
                ],
              ),
            ),
            SizedBox(height: 20.sp),
            const CustomTextField(
              hintText: "Name",
            ),
            const CustomTextField(
              hintText: "Email",
            ),
            PhoneNumberField(
              initalValue: "IT",
              onChanged: (value) {},
            ),
            CustomDropDown(
                hintText: "Gender",
                items: const [
                  DropdownMenuItem(value: "Male", child: Text("Male")),
                  DropdownMenuItem(value: "Female", child: Text("Female")),
                  DropdownMenuItem(value: "Female", child: Text("Other"))
                ],
                onChanged: (value) {}),
            const CustomTextField(
              hintText: "Address",
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: pagePadding,
        child: PrimaryButton(onPressed: () {}, text: 'Update'),
      ),
    );
  }
}
