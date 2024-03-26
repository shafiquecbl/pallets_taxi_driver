import 'package:flutter/material.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/chat/widgets/receiver_chat_container.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/chat/widgets/sender_chat_container.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return index == 2
            ? const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ReceiverChatContainer(
                    text:
                        "ok, I am Comming, wait for a second i am just boarding on the bus",
                    time: "10:30",
                  ),
                ],
              )
            : const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SenderChatContainer(
                    text: "ok, ",
                    time: "10:30",
                  ),
                ],
              );
      },
    );
  }
}
