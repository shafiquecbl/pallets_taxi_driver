import 'package:flutter/material.dart';
import 'package:pallets_taxi_driver_pannel/common/buttons.dart';
import 'package:pallets_taxi_driver_pannel/common/textfield.dart';
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';

class CancelRequestView extends StatelessWidget {
  const CancelRequestView({super.key});

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
          'Overview',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Padding(
        padding: pagePadding.copyWith(top: kToolbarHeight),
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

            ListView(shrinkWrap: true, children: [
              for (int i = 0; i < 5; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: CancelatingListTile(
                    value: true,
                    title: "Cancellation",
                    onChanged: (value) {},
                  ),
                )
            ]),

            SizedBox(
              height: 20,
            ),

            CustomTextField(
              maxLines: 3,
              hintText: "Other",
            ),

            SizedBox(
              height: 20,
            ),

            SizedBox(
              width: double.infinity,
              child: CustomMaterialButton(text: "Submit", ontab: () {}),
            )
          ],
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
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: value ? primaryColor : borderColor)),
      child: ListTile(
        style: ListTileStyle.list,
        leading: Checkbox(
          value: true,
          onChanged: (value) {},
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          fillColor: MaterialStateColor.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return Colors.green;
            }
            return Colors.grey;
          }),
        ),
        title: Text(title),
      ),
    );
  }
}
