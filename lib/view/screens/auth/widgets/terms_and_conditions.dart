// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:pallets_taxi_driver_pannel/controller/auth/signup_controller.dart';
// import 'package:pallets_taxi_driver_pannel/utils/colors.dart';

// class TermsAndConditions extends StatelessWidget {
//   const TermsAndConditions({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Obx(() {
//           return Checkbox(
//               value: SignUpController.instance.isAllowTerms.value,
//               activeColor: Colors.green,
//               onChanged: (value) {
//                 SignUpController.instance.isAllowTerms.value = value!;
//               },
//               shape: ContinuousRectangleBorder(
//                   borderRadius: BorderRadius.circular(50)));
//         }),
//         Expanded(
//           child: RichText(
//               text: TextSpan(children: [
//             TextSpan(
//                 text: "By continuing, you agree to our ",
//                 style: Theme.of(context).textTheme.titleLarge),
//             TextSpan(
//                 text: "Terms of Service",
//                 style: Theme.of(context)
//                     .textTheme
//                     .titleLarge!
//                     .copyWith(color: primaryColor)),
//             TextSpan(
//                 text: " and ", style: Theme.of(context).textTheme.titleLarge),
//             TextSpan(
//                 text: "Privacy Policy",
//                 style: Theme.of(context)
//                     .textTheme
//                     .titleLarge!
//                     .copyWith(color: primaryColor))
//           ])),
//         ),
//       ],
//     );
//   }
// }
