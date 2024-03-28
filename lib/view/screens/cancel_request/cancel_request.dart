import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pallets_taxi_driver_pannel/common/buttons.dart';
import 'package:pallets_taxi_driver_pannel/common/textfield.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';
import 'package:pallets_taxi_driver_pannel/view/base/primary_button.dart';

class CancelRequestScreen extends StatelessWidget {
  const CancelRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text('Overview'),
      ),
      body: Padding(
        padding: pagePadding.copyWith(top: 30.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Please select the reason of cancellation.",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: 20,
            ),

            // Cancel Request

            ListView.separated(
              itemCount: 5,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(height: 15.sp),
              itemBuilder: (context, index) {
                return CancelatingListTile(
                  value: index.isEven,
                  title: "Driver is taking too long",
                  onChanged: (value) {},
                );
              },
            ),

            SizedBox(height: 15.sp),

            const CustomTextField(maxLines: 3, hintText: "Other"),

            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: pagePadding,
        child: PrimaryButton(
          text: 'Submit',
          onPressed: () {},
        ),
      ),
    );
  }
}

class CancelatingListTile extends StatelessWidget {
  final bool value;
  final String title;
  final void Function(bool?)? onChanged;
  const CancelatingListTile(
      {super.key, required this.value, required this.title, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        border: Border.all(color: borderColor),
      ),
      child: CheckboxListTile(
        title: Text(title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.black)),
        value: value,
        onChanged: onChanged,
        contentPadding: EdgeInsets.symmetric(horizontal: 5.sp),
        visualDensity: const VisualDensity(horizontal: -4, vertical: 0),
        controlAffinity: ListTileControlAffinity.leading,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(5.sp),
        ),
        side: const BorderSide(color: borderColor),
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.green;
          }
          return Colors.transparent;
        }),
      ),
    );
  }
}
