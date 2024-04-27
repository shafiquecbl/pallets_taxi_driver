import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pallets_taxi_driver_pannel/utils/app_constants.dart';

class NotificationHelper {
  static Future<void> initialize() async {
    await FirebaseMessaging.instance.getInitialMessage().then((message) {});
    FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    // android
    var androidInitialize =
        const AndroidInitializationSettings('@mipmap/ic_launcher');

    // iOS
    var iOSInitialize = const DarwinInitializationSettings();

    // initialization settings
    var initializationsSettings = InitializationSettings(
      android: androidInitialize,
      iOS: iOSInitialize,
    );

    // initialize
    flutterLocalNotificationsPlugin.initialize(
      initializationsSettings,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      showNotification(message, flutterLocalNotificationsPlugin, kIsWeb);
    });
  }

  static Future<void> showNotification(RemoteMessage message,
      FlutterLocalNotificationsPlugin fln, bool data) async {
    String? title;
    String? body;
    String? orderID;
    String? type = '';

    if (data) {
      title = message.data['title'];
      body = message.data['body'];
      orderID = message.data['order_id'];
    } else {
      title = message.notification!.title;
      body = message.notification!.body;
      orderID = message.notification!.titleLocKey;
    }

    if (message.data['type'] != null) {
      type = message.data['type'];
    }

    Map<String, String> payloadData = {
      'title': title ?? '',
      'body': body ?? '',
      'order_id': orderID ?? '',
      'type': type ?? '',
    };

    PayloadModel payload = PayloadModel.fromJson(payloadData);

    await showBigTextNotification(payload, fln);
  }

  static Future<void> showBigTextNotification(
      PayloadModel payload, FlutterLocalNotificationsPlugin fln) async {
    final bigTextStyleInformation = BigTextStyleInformation(
      payload.body!,
      htmlFormatBigText: true,
      contentTitle: payload.title,
      htmlFormatContentTitle: true,
    );

    final androidPlatformChannelSpecifics = AndroidNotificationDetails(
      AppConstants.APP_NAME,
      AppConstants.APP_NAME,
      importance: Importance.max,
      styleInformation: bigTextStyleInformation,
      priority: Priority.max,
      playSound: true,
      // sound: const RawResourceAndroidNotificationSound('notification'),
    );

    final platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await fln.show(
      0,
      payload.title,
      payload.body,
      platformChannelSpecifics,
      payload: jsonEncode(payload.toJson()),
    );
  }

  static Future<dynamic> myBackgroundMessageHandler(
      RemoteMessage message) async {
    debugPrint(
        "onBackground: ${message.notification!.title}/${message.notification!.body}/${message.notification!.titleLocKey}");
  }
}

class PayloadModel {
  PayloadModel({
    this.title,
    this.body,
    this.orderId,
    this.image,
    this.type,
  });

  String? title;
  String? body;
  String? orderId;
  String? image;
  String? type;

  factory PayloadModel.fromRawJson(String str) =>
      PayloadModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PayloadModel.fromJson(Map<String, dynamic> json) => PayloadModel(
        title: json["title"],
        body: json["body"],
        orderId: json["order_id"],
        image: json["image"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "body": body,
        "order_id": orderId,
        "image": image,
        "type": type,
      };
}
