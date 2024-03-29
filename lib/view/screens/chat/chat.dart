import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pallets_taxi_driver_pannel/common/buttons.dart';
import 'package:pallets_taxi_driver_pannel/common/textfield.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
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
              height: 85.sp,
              padding: EdgeInsets.symmetric(vertical: 15.sp),
              decoration: BoxDecoration(
                // top border
                border: const Border(
                  top: BorderSide(color: borderColor),
                ),
                color: Colors.grey[100],
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Iconsax.add_circle, color: primaryColor),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Type a message',
                        enabledBorder: border(),
                        border: border(),
                        focusedBorder: border(),
                        contentPadding: EdgeInsets.all(18.sp),
                        fillColor: Colors.white,
                        filled: true,
                        hintStyle: Theme.of(context).textTheme.bodyMedium,
                      ),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Iconsax.send_2, color: primaryColor),
                  )
                ],
              ),
            ),
          ]),
    );
  }
}
