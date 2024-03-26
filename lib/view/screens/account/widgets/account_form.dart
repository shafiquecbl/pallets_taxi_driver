import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:pallets_taxi_driver_pannel/common/textfield.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 64,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: borderColor)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Rating: "),
                CustomRatingBar(rating: 3.4),
                SizedBox(
                  width: 20,
                ),
                Text("4.5"),
                Text("(20+)")
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const CustomTextField(
          hintText: "Name",
        ),
        const SizedBox(
          height: 10,
        ),
        const CustomTextField(
          hintText: "Email",
        ),
        const SizedBox(
          height: 10,
        ),
        PhoneNumberField(
          initalValue: "IT",
          onChanged: (p0) {},
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 64,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: borderColor)),
          child: CustomDropDown(
              hintText: "Gender",
              items: const [
                DropdownMenuItem(value: "Male", child: Text("Male")),
                DropdownMenuItem(value: "Female", child: Text("Female")),
                DropdownMenuItem(value: "Female", child: Text("Other"))
              ],
              onChanged: (value) {}),
        ),
        const SizedBox(
          height: 10,
        ),
        const CustomTextField(
          hintText: "Address",
        ),
      ],
    ));
  }
}

class PhoneNumberField extends StatelessWidget {
  final void Function(CountryCode)? onChanged;
  final String initalValue;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const PhoneNumberField(
      {super.key,
      this.onChanged,
      this.initalValue = "IT",
      this.controller,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
      child: Row(children: [
        Expanded(
          flex: 5,
          child: CountryCodePicker(
            onChanged: onChanged,
            initialSelection: initalValue,
            showCountryOnly: true,
            showOnlyCountryWhenClosed: false,
            showFlag: true,
            showDropDownButton: true,
            showFlagMain: true,
            alignLeft: false,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: VerticalDivider(
            width: 1,
            color: borderColor,
            thickness: 1,
          ),
        ),
        Expanded(
          flex: 8,
          child: SizedBox(
              width: 200,
              child: TextFormField(
                controller: controller,
                validator: validator,
                decoration: const InputDecoration(border: InputBorder.none),
              )),
        ),
      ]),
    );
  }
}

class CustomRatingBar extends StatelessWidget {
  final double rating;
  const CustomRatingBar({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemBuilder: (context, index) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      itemCount: 5,
      itemSize: 20.0,
      direction: Axis.horizontal,
    );
  }
}
