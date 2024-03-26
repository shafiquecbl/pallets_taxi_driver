import 'package:flutter/material.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';

class SenderChatContainer extends StatelessWidget {
  final String text;
  final String time;
  final String? imageurl;
  const SenderChatContainer(
      {super.key, required this.text, required this.time, this.imageurl});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          /// message
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: primaryColor),
                color: sendMessagebackColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              if (imageurl != null)
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
                constraints: BoxConstraints(
                  maxWidth: screenWidth * 0.5,
                ),
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
    );
  }
}
