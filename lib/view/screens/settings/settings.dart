import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pallets_taxi_driver_pannel/common/buttons.dart';
import 'package:pallets_taxi_driver_pannel/controller/auth_controller.dart';
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/html/html_screen.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/profile/profile.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/document_verification/document_verification.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/notifications/notification.dart';
import '../../../controller/spash_controller.dart';
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
            icon: Iconsax.calendar5,
            trailing: Switch(
              value: true,
              onChanged: (value) {},
            ),
          ),
          SettingTile(
            text: 'Profile',
            icon: Iconsax.profile_circle5,
            onTap: () => launchScreen(const ProfileScreen()),
          ),
          SettingTile(
            text: 'FAQ',
            icon: Iconsax.messages_3,
            onTap: () => launchScreen(
                HtmlScreen(html: SplashController.find.appSetting?.faq ?? '')),
          ),
          SettingTile(
            text: 'Privacy Policy',
            icon: Iconsax.security_user,
            onTap: () => launchScreen(HtmlScreen(
                html: SplashController.find.appSetting?.privacyPolicy ?? '')),
          ),
          SettingTile(
            text: 'About Us',
            icon: Iconsax.info_circle,
            onTap: () => launchScreen(HtmlScreen(
                html: SplashController.find.appSetting?.aboutUs ?? '')),
          ),

          SettingTile(
            text: 'Document Verification',
            icon: Iconsax.document_text5,
            onTap: () {
              launchScreen(
                  const DocumentVerificationScreen(fromSettings: true));
            },
          ),
          SettingTile(
            text: 'Sign Out',
            icon: Iconsax.logout,
            onTap: AuthController.find.logout,
          )
        ],
      ),
    );
  }
}
