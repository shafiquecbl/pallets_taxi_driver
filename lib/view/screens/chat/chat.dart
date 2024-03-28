import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pallets_taxi_driver_pannel/common/buttons.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/images.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/chat/widgets/chat_list.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const CustomBackButton(),
          title: const Text('Chat'),
          actions: [
            OutlinedIconButton(icon: Icons.call_outlined, onTap: () {}),
            SizedBox(width: 10.sp),
          ]),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            /// chat list
            const Expanded(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: ChatList())),

            Container(
              height: 60,
              padding: const EdgeInsets.only(bottom: 15),
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          Images.add_icon,
                          fit: BoxFit.fill,
                        )),
                  ),
                  Expanded(
                    flex: 8,
                    child: TextField(
                        decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: borderColor)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: borderColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: borderColor)),
                      contentPadding: const EdgeInsets.all(18),
                    )),
                  ),
                  Expanded(
                    flex: 2,
                    child: IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          Images.send_icon,
                          fit: BoxFit.fill,
                        )),
                  )
                ],
              ),
            ),
          ]),
    );
  }
}
