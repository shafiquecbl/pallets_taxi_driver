import 'package:flutter/material.dart';
import 'package:pallets_taxi_driver_pannel/common/network_image.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/images.dart';

class ReceiverChatContainer extends StatelessWidget {
  final String text;
  final String time;
  final String? senderImageAddress;
  final String? thumnailImageAddress;

  const ReceiverChatContainer(
      {super.key,
      required this.text,
      required this.time,
      this.thumnailImageAddress,
      this.senderImageAddress});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: const SizedBox(
                width: 36,
                height: 36,
                child: CustomNetworkImage(url: Images.user_placeholder)),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    color: reciveMessagebackColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (thumnailImageAddress != null)
                        Container(
                          width: 104,
                          height: 95,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: sendMessagebackColor,
                          ),

                          /// video or image adder
                          // child: Image.file(thumnailImageAddress),
                        ),
                      ConstrainedBox(
                        constraints:
                            BoxConstraints(maxWidth: screenWidth * 0.5),
                        child: Text(text,
                            softWrap: true,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontSize: 14)),
                      ),
                    ]),
              ),
              Text(time,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
