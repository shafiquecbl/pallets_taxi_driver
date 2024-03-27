import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pallets_taxi_driver_pannel/controller/auth_controller.dart';
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/images.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/chat/chat_messaging_view.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/notifications/notification_view.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/document_verification/document_verification.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  bool status = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: pagePadding.copyWith(top: kToolbarHeight),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Profile',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                FittedBox(
                  fit: BoxFit.none,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: borderColor),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Iconsax.notification)),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 20,
            ),

            /// user profile list
            ///
            StatefulBuilder(
              builder: (context, setState) => UserProfileListTile(
                text: 'Status',
                image: Images.status_icon,
                trailing: Switch(
                  value: status,
                  onChanged: (value) {
                    setState(() {});
                    status = value;
                  },
                ),
              ),
            ),

            UserProfileListTile(
              text: 'Notification',
              image: Images.notification_icon,
              onTap: () {
                launchScreen(const NotificationView());
              },
            ),
            UserProfileListTile(
              text: 'FAQ',
              image: Images.faq_icon,
              onTap: () {
                launchScreen(const ChatView());
              },
            ),
            UserProfileListTile(
              text: 'Privacy Policy',
              image: Images.privacy_icon,
              onTap: () {},
            ),

            UserProfileListTile(
              text: 'About Us',
              image: Images.about_icon,
              onTap: () {},
            ),

            UserProfileListTile(
              text: 'Customer Documentations',
              image: Images.document_image,
              onTap: () {
                launchScreen(const DocumentVerificationScreen());
              },
            ),
            UserProfileListTile(
              text: 'Sign Out',
              image: Images.document_image,
              icon: Icon(Iconsax.logout, color: Colors.red, size: 30.sp),
              onTap: AuthController.find.logout,
            )
          ],
        ),
      ),
    );
  }
}

class UserProfileListTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final String image;
  final Widget? icon;
  final Widget? trailing;
  const UserProfileListTile(
      {super.key,
      required this.text,
      this.onTap,
      required this.image,
      this.icon,
      this.trailing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: borderColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                icon ?? Image.asset(image),
                const SizedBox(
                  width: 10,
                ),
                Text(text)
              ]),
              trailing ?? const Icon(Icons.arrow_forward_ios_outlined),
            ],
          ),
        ),
      ),
    );
  }
}
