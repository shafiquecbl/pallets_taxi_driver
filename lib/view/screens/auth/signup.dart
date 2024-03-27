import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pallets_taxi_driver_pannel/common/buttons.dart';
import 'package:pallets_taxi_driver_pannel/common/snackbar.dart';
import 'package:pallets_taxi_driver_pannel/common/text.dart';
import 'package:pallets_taxi_driver_pannel/common/textfield.dart';
import 'package:pallets_taxi_driver_pannel/controller/auth_controller.dart';
import 'package:pallets_taxi_driver_pannel/data/model/body/singup_model.dart';
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';
import 'package:pallets_taxi_driver_pannel/utils/validators/validation.dart';
import 'package:pallets_taxi_driver_pannel/view/base/primary_button.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/document_verification/document_verification.dart';

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
  final _vehicleController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isComercialAuto = false;
  bool _isDotMT = false;
  String _countryCode = "IT";

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

    _vehicleController.dispose();
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

            // FORM START,

            SizedBox(height: 20.sp),
            CustomTextField(
              controller: _nameController,
              hintText: "Name",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter name";
                } else {
                  return null;
                }
              },
            ),

            CustomTextField(
              controller: _emailController,
              hintText: "Email",
              validator: TValidator.validateEmail,
            ),

            CustomTextField(
              controller: _passwordController,
              obscureText: true,
              hintText: "Password",
              validator: TValidator.validatePassword,
            ),

            PhoneNumberField(
              initalValue: _countryCode,
              controller: _phoneNumberController,
              validator: TValidator.validatePhoneNumber,
              onChanged: (value) {
                _countryCode = value.dialCode ?? _countryCode;
              },
            ),

            CustomTextField(
              hintText: "Vehicale Number",
              controller: _vehicleController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter state";
                } else {
                  return null;
                }
              },
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
            PrimaryButton(text: "Sign Up", onPressed: _signup),
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
      SignUpModel model = SignUpModel(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
        phoneNumber: _countryCode + _phoneNumberController.text,
        vehicleNumber: _vehicleController.text,
        dotMc: _isDotMT,
        commercialAuto: _isComercialAuto,
      );
      AuthController.find.registration(model).then((value) {
        showToast('Registration Successfull');
        launchScreen(const DocumentVerificationScreen(), pushAndRemove: true);
      });
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
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.sp),
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
            keyboardType: TextInputType.phone,
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
