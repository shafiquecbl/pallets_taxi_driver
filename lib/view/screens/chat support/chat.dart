// ignore_for_file: unused_field, prefer_final_fields

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';
import 'package:pallets_taxi_driver_pannel/controller/chat_support_controller.dart';
import 'widgets/chat_bubble.dart';

class ChatSupportScreen extends StatefulWidget {
  const ChatSupportScreen({super.key});

  @override
  State<ChatSupportScreen> createState() => _ChatSupportScreenState();
}

class _ChatSupportScreenState extends State<ChatSupportScreen> {
  final TextEditingController messageController = TextEditingController();
  bool _isFirst = true;
  Timer? _timer;

  @override
  void initState() {
    initData();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      initData();
    });
    super.initState();
  }

  initData() {
    ChatController.to.getMessages(1, _isFirst);
    if (_isFirst) {
      _isFirst = false;
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ChatController>(
        builder: (con) {
          return Column(
            children: [
              Expanded(
                child: con.messageList == null
                    ? const Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
                    : ListView.builder(
                        itemCount: con.messageList?.length,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        reverse: true,
                        itemBuilder: (context, index) {
                          bool chatWithDriver =
                              con.messageList![index].deliverymanId != null;
                          bool isMe = con.messageList![index].isReply ?? false;

                          return ChatBubble(
                            chatWithDriver: chatWithDriver,
                            isMe: chatWithDriver ? isMe : !isMe,
                            message: con.messageList![index],
                          );
                        },
                      ),
              ),
              if (con.chatImage != null && con.chatImage!.isNotEmpty)
                Wrap(
                  runSpacing: 5,
                  children: [
                    for (int i = 0; i < con.chatImage!.length; i++)
                      SizedBox(
                        height: 90,
                        width: 90,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            SizedBox(
                              height: 80,
                              width: 80,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  File(con.imageFiles![i].path),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            // remove button,
                            Positioned(
                              top: 0,
                              right: 0,
                              child: InkWell(
                                onTap: () => con.removeImage(i),
                                child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Icon(
                                        Icons.clear,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      )
                  ],
                ),
              Container(
                padding: pagePadding,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20.sp)),
                ),
                child: Row(
                  children: [
                    IconButton(
                      visualDensity:
                          const VisualDensity(horizontal: -4, vertical: -4),
                      padding: EdgeInsets.zero,
                      icon: Icon(Iconsax.gallery_add, size: 22.sp),
                      onPressed: () => con.pickImage(false),
                    ),
                    SizedBox(width: 8.sp),
                    // text field
                    Expanded(
                      child: TextField(
                        controller: messageController,
                        onChanged: (value) {
                          con.isComposing = value.isNotEmpty;
                        },
                        decoration: InputDecoration(
                          hintText: 'Type your message here',
                          hintStyle: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Theme.of(context).hintColor),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.sp),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.sp,
                            vertical: 10.sp,
                          ),
                          fillColor: Theme.of(context).scaffoldBackgroundColor,
                          filled: true,
                        ),
                      ),
                    ),

                    // send button
                    if (con.isComposing) ...[
                      const SizedBox(width: 10),
                      con.isLoading
                          ? SizedBox(
                              width: 27.sp,
                              height: 27.sp,
                              child: const CircularProgressIndicator.adaptive(),
                            )
                          : InkWell(
                              onTap: () {
                                con
                                    .sendMessage(messageController.text.trim())
                                    .then((value) {
                                  if (value) {
                                    messageController.clear();
                                    con.isComposing = false;
                                  }
                                });
                              },
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                padding: EdgeInsets.all(10.sp),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Iconsax.arrow_up_3,
                                  size: 24.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                    ],
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
