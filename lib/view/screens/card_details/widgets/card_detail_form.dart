import 'package:flutter/material.dart';
import 'package:pallets_taxi_driver_pannel/common/textfield.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';

class CardDetailForm extends StatelessWidget {
  const CardDetailForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        Text(
          "Withdraw Amount:",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.black54),
        ),
        CustomTextField(),
        SizedBox(height: 20),
        Text(
          "Select bank:",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.black54),
        ),
        Container(
          height: 64,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: borderColor),
          ),
          child: CustomDropDown(
            items: const [
              DropdownMenuItem(
                child: Text("Paypal"),
                value: "Paypal",
              ),
              DropdownMenuItem(
                child: Text("Stripe"),
                value: "Stripe",
              ),
              DropdownMenuItem(
                child: Text("GooglePay"),
                value: "GooglePay",
              )
            ],
            onChanged: (value) {},
            hintText: "Select payment mathod",
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Account Number:",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.black54),
        ),
        CustomTextField(),
        SizedBox(height: 20),
        Text(
          "Key Number:",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.black54),
        ),
        CustomTextField(
          obscureText: true,
          maxLines: 1,
          suffixIcon: IconButton(
            icon: Icon(
              Icons.remove_red_eye,
              color: primaryColor,
            ),
            onPressed: () {},
          ),
        ),
      ],
    ));
  }
}
