import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:pallets_taxi_driver_pannel/common/snackbar.dart';
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';
import 'package:pallets_taxi_driver_pannel/view/base/primary_button.dart';

Future showOTPDialog({required Function(String) onAccept}) {
  return showDialog(
    context: Get.context!,
    builder: (context) => OTPDialog(onAccept: onAccept),
  );
}

class OTPDialog extends StatefulWidget {
  final Function(String) onAccept;
  const OTPDialog({required this.onAccept, super.key});

  @override
  State<OTPDialog> createState() => _OTPDialogState();
}

class _OTPDialogState extends State<OTPDialog> {
  String otp = '';
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 30),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Enter OTP',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: defautSpacing),
            const Text(
              'Enter the OTP display in customer mobile to start the ride',
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.sp),
              child: OTPTextField(
                length: 4,
                width: MediaQuery.of(context).size.width * 0.8,
                fieldWidth: 48,
                style: const TextStyle(fontSize: 17),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                spaceBetween: 5,
                otpFieldStyle: OtpFieldStyle(
                  focusBorderColor: primaryColor,
                ),
                onChanged: (value) {
                  otp = value;
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Expanded(
                  child: PrimaryOutlineButton(
                      text: 'Cancel', radius: 32, onPressed: pop),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: PrimaryButton(
                    text: 'Done',
                    radius: 32,
                    onPressed: () {
                      if (otp.length < 4) {
                        showToast('Please enter valid OTP');
                        return;
                      }
                      widget.onAccept(otp);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
