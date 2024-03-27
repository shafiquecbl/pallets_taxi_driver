import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pallets_taxi_driver_pannel/common/buttons.dart';
import 'package:pallets_taxi_driver_pannel/common/textfield.dart';
import 'package:pallets_taxi_driver_pannel/controller/auth_controller.dart';
import 'package:pallets_taxi_driver_pannel/controller/profile_controller.dart';
import 'package:pallets_taxi_driver_pannel/data/model/response/user_model.dart';
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';
import 'package:pallets_taxi_driver_pannel/utils/validators/validation.dart';
import 'package:pallets_taxi_driver_pannel/view/base/primary_button.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/auth/signup.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isObscure = true;

  _toogleObsureText() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        toolbarHeight: (kToolbarHeight * 1.5).sp,
        automaticallyImplyLeading: false,
        leading: const CustomBackButton(),
        title: Text(
          'Sign In',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Padding(
        padding: pagePadding,
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              CustomTextField(
                hintText: "Email or Phone Number",
                controller: _emailController,
                validator: (value) => TValidator.validateEmail(value),
              ),
              CustomTextField(
                hintText: "Enter Password",
                obscureText: _isObscure,
                controller: _passwordController,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure ? Icons.remove_red_eye : Icons.visibility_off,
                    color: primaryColor,
                  ),
                  onPressed: _toogleObsureText,
                ),
                validator: (value) => TValidator.validatePassword(value),
                padding: EdgeInsets.zero,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password ?",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: primaryColor),
                    )),
              ),
              SizedBox(height: 30.sp),
              SizedBox(
                width: double.infinity,
                child: PrimaryButton(text: "Sign In", onPressed: _signinScreen),
              ),
              const Spacer(),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: "Don't have an account?",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                TextSpan(
                  text: " Sign Up",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => launchScreen(const SignUpScreen()),
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: primaryColor),
                )
              ]))
            ],
          ),
        ),
      ),
    );
  }

  _signinScreen() {
    if (_formkey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text;
      AuthController.find.login(email, password).then((value) async {
        if (value.isSuccess) {
          UserModel? user = await ProfileController.find.getProfile();
          goToDashboard(user);
        }
      });
    }
  }
}
