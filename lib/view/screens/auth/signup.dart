import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pallets_taxi_driver_pannel/common/buttons.dart';
import 'package:pallets_taxi_driver_pannel/common/text.dart';
import 'package:pallets_taxi_driver_pannel/common/textfield.dart';
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';
import 'package:pallets_taxi_driver_pannel/utils/validators/validation.dart';
import 'package:pallets_taxi_driver_pannel/view/base/primary_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _stateController = TextEditingController();
  final _vehicaleController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isComercialAuto = false;
  bool _isDotMT = false;

  _toogleCommercial() {
    setState(() {
      _isComercialAuto = !_isComercialAuto;
    });
  }

  _toogleDot() {
    setState(() {
      _isDotMT = !_isDotMT;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _stateController.dispose();
    _vehicaleController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        automaticallyImplyLeading: false,
        leading: const CustomBackButton(),
        title: const Text('Sign Up'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: pagePadding,
          children: [
            SizedBox(height: 10.sp),
            const PageHeading(title: "Fill All The Field"),

            // FORM START

            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              validator: (value) => TValidator.validateName(value),
              controller: _nameController,
              hintText: "Name",
              maxLines: 1,
            ),

            CustomTextField(
              validator: (value) => TValidator.validateEmail(value),
              controller: _emailController,
              hintText: "Email",
              maxLines: 1,
            ),

            CustomTextField(
              validator: (value) => TValidator.validatePassword(value),
              controller: _passwordController,
              obscureText: true,
              hintText: "Password",
              maxLines: 1,
            ),

            PhoneNumberField(
              initalValue: "IT",
              validator: (value) => TValidator.validatePhoneNumber(value),
              controller: _phoneNumberController,
            ),

            CustomTextField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter state";
                } else {
                  return null;
                }
              },
              hintText: "Address",
              maxLines: 1,
              controller: _addressController,
            ),

            CustomTextField(
              hintText: "State",
              maxLines: 1,
              validator: (p0) {
                if (p0 == null || p0.isEmpty) {
                  return "Please enter state";
                } else {
                  return null;
                }
              },
              controller: _stateController,
            ),

            CustomTextField(
              hintText: "Vehicale Number",
              maxLines: 1,
              validator: (p0) {
                if (p0 == null || p0.isEmpty) {
                  return "Please enter state";
                } else {
                  return null;
                }
              },
              controller: _vehicaleController,
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 20.sp),
              child: CheckboxListTile(
                title: Text(
                  'Add DOT/MC?',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                value: _isDotMT,
                onChanged: (value) => _toogleDot(),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: borderColor),
                  borderRadius: BorderRadius.circular(8),
                ),
                side: const BorderSide(color: borderColor),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 20.sp),
              child: CheckboxListTile(
                title: Text(
                  'Add Commercial Auto?',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                value: _isComercialAuto,
                onChanged: (value) => _toogleCommercial(),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: borderColor),
                  borderRadius: BorderRadius.circular(8),
                ),
                side: const BorderSide(color: borderColor),
              ),
            ),
            // FORM END

            SizedBox(height: 20.sp),
            PrimaryButton(
              text: "Sign Up",
              onPressed: () {},
            ),
            SizedBox(height: 30.sp),
            Center(
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: "Already have an account?",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                TextSpan(
                  text: " Sign In",
                  recognizer: TapGestureRecognizer()..onTap = pop,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: primaryColor),
                )
              ])),
            )
          ],
        ),
      ),
    );
  }

  _signup() {
    if (_formKey.currentState!.validate()) {
      // call api
    }
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
      margin: EdgeInsets.only(bottom: 20.sp),
      // height: 60,
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
        Expanded(
          flex: 8,
          child: TextFormField(
            controller: controller,
            validator: validator,
            maxLines: 1,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Enter phone number",
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.normal),
              contentPadding: EdgeInsets.symmetric(vertical: 12.sp),
            ),
          ),
        ),
      ]),
    );
  }
}
