import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pallets_taxi_driver_pannel/common/buttons.dart';
import 'package:pallets_taxi_driver_pannel/controller/auth_controller.dart';
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/images.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/profile/profile.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/chat/chat.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/document_verification/document_verification.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/notifications/notification.dart';
import 'widgets/setting_tile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: false,
        actions: [
          OutlinedIconButton(
            icon: Iconsax.notification,
            onTap: () => launchScreen(const NotificationScreen()),
          ),
          SizedBox(width: 10.sp),
        ],
      ),
      body: ListView(
        padding: pagePadding,
        children: [
          /// user profile list
          SettingTile(
            text: 'Status',
            image: Images.status_icon,
            trailing: Switch(
              value: true,
              onChanged: (value) {},
            ),
          ),

          SettingTile(
            text: 'Profile',
            icon:
                Icon(Iconsax.profile_circle5, color: primaryColor, size: 30.sp),
            onTap: () => launchScreen(const ProfileScreen()),
          ),
          SettingTile(
            text: 'FAQ',
            image: Images.faq_icon,
            onTap: () {
              launchScreen(const ChatScreen());
            },
          ),
          SettingTile(
            text: 'Privacy Policy',
            image: Images.privacy_icon,
            onTap: () {},
          ),

          SettingTile(
            text: 'About Us',
            image: Images.about_icon,
            onTap: () {},
          ),

          SettingTile(
            text: 'Customer Documentations',
            image: Images.document_image,
            onTap: () {
              launchScreen(
                  const DocumentVerificationScreen(fromSettings: true));
            },
          ),
          SettingTile(
            text: 'Sign Out',
            image: Images.document_image,
            icon: Icon(Iconsax.logout, color: Colors.red, size: 30.sp),
            onTap: AuthController.find.logout,
          )
        ],
      ),
    );
  }
}
