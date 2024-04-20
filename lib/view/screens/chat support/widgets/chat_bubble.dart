import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pallets_taxi_driver_pannel/common/network_image.dart';
import 'package:pallets_taxi_driver_pannel/data/model/response/chat_model.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';

class ChatBubble extends StatelessWidget {
  final Messages message;
  final bool isMe;
  const ChatBubble({required this.isMe, required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    final bubbleColor = isMe ? sendMessagebackColor : reciveMessagebackColor;
    final bubbleAlign =
        isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final bubbleBorderRadius = isMe
        ? const BorderRadius.all(Radius.circular(15)).copyWith(
            bottomRight: Radius.zero,
          )
        : const BorderRadius.all(Radius.circular(15)).copyWith(
            bottomLeft: Radius.zero,
          );

    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0).copyWith(
          left: !isMe ? 0.0 : 70,
          right: !isMe ? 70 : 0.0,
        ),
        child: Column(
          crossAxisAlignment: bubbleAlign,
          children: [
            Container(
              decoration: BoxDecoration(
                color: bubbleColor.withOpacity(0.3),
                borderRadius: bubbleBorderRadius,
                border: Border.all(
                  color: bubbleColor,
                  width: 1.5,
                ),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (images != null && images!.isNotEmpty)
                    Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      children: images!
                          .map((e) => SizedBox(
                                height: 80,
                                width: 80,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Hero(
                                    tag: e,
                                    child: CustomNetworkImage(url: e),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  if (message.message != null &&
                      message.image != null &&
                      message.image!.isNotEmpty)
                    const SizedBox(height: 5),
                  if (message.message != null)
                    Text(
                      message.message!,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  const SizedBox(height: 5.0),
                  Text(
                    DateFormat('MMM dd, hh:mm a')
                        .format(DateTime.parse(message.createdAt!)),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.normal,
                          color: Theme.of(context).hintColor,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String>? get images {
    if (message.image != null && message.image!.isNotEmpty) {
      return message.image;
    } else if (message.attachment != null && message.attachment!.isNotEmpty) {
      return message.attachment;
    } else {
      return null;
    }
  }
}
