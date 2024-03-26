import 'package:flutter/material.dart';
import 'package:pallets_taxi_driver_pannel/common/text.dart';
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/card_details/widgets/card_detail_form.dart';

class CardDetailsView extends StatelessWidget {
  const CardDetailsView({super.key});

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
                borderRadius: BorderRadius.circular(10)),
            child: IconButton(
                onPressed: () {
                  pop();
                },
                icon: const Icon(Icons.arrow_back_ios_new_sharp)),
          ),
        ),
        title: Text(
          'Card Details',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: pagePadding,
          child: const Column(children: [
            SizedBox(
              height: 20,
            ),
            PageHeading(
              title: "Enter card credentials",
            ),
            CardDetailForm()
          ]),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: pagePadding,
        child: MaterialButton(
            height: 50,
            onPressed: () {
              // showSuccessPopup(title: "Successfulay Withdraw", message: "",);
            },
            color: primaryColor,
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(15)),
            child: Text(
              "Withdraw",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.white),
            )),
      ),
    );
  }
}

class PaymentTypeCheckBox extends StatelessWidget {
  final String title;
  final bool isSelected;
  final void Function(bool?)? onPressed;
  final String imageAddress;
  const PaymentTypeCheckBox(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.onPressed,
      required this.imageAddress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: double.infinity,
        height: 66,
        decoration: BoxDecoration(
            color: isSelected ? Colors.amber : Colors.white,
            border: Border.all(color: isSelected ? primaryColor : Colors.grey),
            borderRadius: BorderRadiusDirectional.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset(
                        imageAddress,
                        fit: BoxFit.cover,
                      )),
                  const SizedBox(width: 10),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.white),
                  ),
                ],
              ),
              RadioMenuButton(
                value: true,
                groupValue: isSelected,
                onChanged: onPressed,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

enum PaymentMethos { paypal, stripe, cash }
