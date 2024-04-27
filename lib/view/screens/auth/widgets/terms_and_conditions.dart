import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pallets_taxi_driver_pannel/controller/spash_controller.dart';
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/html/html_screen.dart';

class TermsAndConditions extends StatelessWidget {
  final void Function(bool?)? onChanged;
  final bool isChecked;
  const TermsAndConditions({
    super.key,
    required this.onChanged,
    required this.isChecked,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.bodySmall,
          children: [
            const TextSpan(text: "By continuing, you agree to our "),
            TextSpan(
              text: "Terms & Conditions",
              style: const TextStyle(color: primaryColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () => launchScreen(HtmlScreen(
                    html: SplashController.find.appSetting?.termsCondition ??
                        '')),
            ),
            const TextSpan(text: " and "),
            TextSpan(
              text: "Privacy Policy",
              style: const TextStyle(color: primaryColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () => launchScreen(HtmlScreen(
                    html:
                        SplashController.find.appSetting?.privacyPolicy ?? '')),
            )
          ],
        ),
      ),
      value: isChecked,
      onChanged: onChanged,
      contentPadding: const EdgeInsets.all(0),
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      controlAffinity: ListTileControlAffinity.leading,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(32.sp),
      ),
      fillColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.green;
        }
        return Colors.transparent;
      }),
    );
  }
}
