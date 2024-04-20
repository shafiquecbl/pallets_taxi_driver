import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pallets_taxi_driver_pannel/common/network_image.dart';
import 'package:pallets_taxi_driver_pannel/data/model/response/chat_model.dart';

class ChatBubble extends StatelessWidget {
  final Messages message;
  final bool isMe;
  final bool chatWithDriver;
  const ChatBubble(
      {required this.isMe,
      required this.message,
      required this.chatWithDriver,
      super.key});

  @override
  Widget build(BuildContext context) {
    final bubbleColor = isMe
        ? Theme.of(context).primaryColor.withOpacity(0.1)
        : Theme.of(context).cardColor;
    final bubbleAlign =
        isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final bubbleBorderRadius = isMe
        ? const BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          )
        : const BorderRadius.only(
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          );

    return chatWithDriver
        ? (!isMe
            ? _meBubble(context, bubbleAlign, bubbleColor, bubbleBorderRadius)
            : _adminBubble(
                context, bubbleAlign, bubbleColor, bubbleBorderRadius))
        : (isMe
            ? _meBubble(context, bubbleAlign, bubbleColor, bubbleBorderRadius)
            : _adminBubble(
                context, bubbleAlign, bubbleColor, bubbleBorderRadius));
  }

  Widget _meBubble(BuildContext context, CrossAxisAlignment bubbleAlign,
          Color bubbleColor, BorderRadiusGeometry bubbleBorderRadius) =>
      GestureDetector(
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
                  color: bubbleColor,
                  borderRadius: bubbleBorderRadius,
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

  Widget _adminBubble(BuildContext context, CrossAxisAlignment bubbleAlign,
          Color bubbleColor, BorderRadiusGeometry bubbleBorderRadius) =>
      GestureDetector(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0)
              .copyWith(left: 0, right: 70),
          child: Column(
            crossAxisAlignment: bubbleAlign,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: bubbleColor,
                  borderRadius: bubbleBorderRadius,
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
                                    child: CustomNetworkImage(url: e),
                                  ),
                                ))
                            .toList(),
                      ),
                    if (message.reply != null &&
                        message.image != null &&
                        message.image!.isNotEmpty)
                      const SizedBox(height: 5),
                    if (message.reply != null)
                      Text(
                        message.reply ?? '',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    const SizedBox(height: 5.0),
                    Text(
                      DateFormat('MMM dd, hh:mm a').format(DateTime.now()),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.normal,
                            color: isMe
                                ? Colors.white70
                                : Theme.of(context).hintColor,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

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
