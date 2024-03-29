import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pallets_taxi_driver_pannel/common/buttons.dart';
import 'package:pallets_taxi_driver_pannel/common/network_image.dart';
import 'package:pallets_taxi_driver_pannel/common/textfield.dart';
import 'package:pallets_taxi_driver_pannel/controller/profile_controller.dart';
import 'package:pallets_taxi_driver_pannel/data/model/response/user_model.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';
import 'package:pallets_taxi_driver_pannel/utils/validators/validation.dart';
import 'package:pallets_taxi_driver_pannel/view/base/primary_button.dart';
import 'package:pallets_taxi_driver_pannel/view/base/rating_bar.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/auth/signup.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserModel get user => ProfileController.find.userModel!;
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  String dialCode = "+39";

  @override
  void initState() {
    nameController.text = user.name;
    emailController.text = user.email;
    phoneController.text = user.phoneNumber.substring(dialCode.length);
    dialCode = user.phoneNumber.substring(0, dialCode.length);
    super.initState();
  }

  _pickImage() async {
    ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        ProfileController.find.updateProfile(
          email: user.email,
          name: user.name,
          phone: user.phoneNumber,
          file: value,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text('Profile'),
      ),
      body: Builder(
        builder: (context) {
          return Form(
            key: _formKey,
            child: ListView(
              padding: pagePadding,
              children: [
                GetBuilder<ProfileController>(builder: (con) {
                  return Center(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: SizedBox(
                            height: 125,
                            width: 125,
                            child:
                                CustomNetworkImage(url: con.userModel?.image),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 18,
                            child: IconButton.filled(
                              onPressed: _pickImage,
                              icon: Icon(Iconsax.camera, size: 18.sp),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),

                SizedBox(height: 15.sp),

                /// name
                Center(
                  child: Text(nameController.text,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: Colors.black54)),
                ),

                SizedBox(height: 40.sp),

                /// sign up form
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: borderColor)),
                  child: Row(
                    children: [
                      Text(
                        "Ratings: ",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      const CustomRatingBar(rating: 4.5),
                      const Spacer(),
                      const Text("4.5 (20+)"),
                    ],
                  ),
                ),
                SizedBox(height: 20.sp),
                CustomTextField(
                  hintText: "Name",
                  controller: nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Name is required";
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  hintText: "Email",
                  controller: emailController,
                  enabled: false,
                ),
                PhoneNumberField(
                  initalValue: dialCode,
                  controller: phoneController,
                  onChanged: (value) {
                    dialCode = value.dialCode ?? dialCode;
                  },
                  validator: (value) => TValidator.validatePhoneNumber(value),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: pagePadding,
        child: PrimaryButton(onPressed: _updateProfile, text: 'Update'),
      ),
    );
  }

  _updateProfile() {
    if (_formKey.currentState!.validate()) {
      ProfileController.find.updateProfile(
        name: nameController.text,
        phone: dialCode + phoneController.text,
        email: user.email,
      );
    }
  }
}
