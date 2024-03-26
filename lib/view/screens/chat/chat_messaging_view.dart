import 'package:flutter/material.dart';
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/images.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/chat/widgets/chat_list.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

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
            'Chat',
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(fontSize: 24),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: FittedBox(
                fit: BoxFit.none,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: borderColor),
                      borderRadius: BorderRadius.circular(10)),
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.call_outlined)),
                ),
              ),
            ),
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
