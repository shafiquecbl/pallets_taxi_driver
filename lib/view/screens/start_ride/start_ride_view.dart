import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';

import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/images.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/camera/camera_screen.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/cancel_request/cancel_request_view.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/chat/chat_messaging_view.dart';

import 'package:pallets_taxi_driver_pannel/view/screens/start_ride/widgets/bottom_sheets.dart';

class StartRideView extends StatefulWidget {
  const StartRideView({Key? key}) : super(key: key);

  @override
  State<StartRideView> createState() => _StartRideViewState();
}

class _StartRideViewState extends State<StartRideView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showDriverInformationBottomSheet(
        arrivalTime: "15 min",
        driveDistance: "2.5 km",
        driverImage: Images.user_placeholder,
        sizeOfBox: '20 x 20',
        driverName: "John Doe",
        startRideTab: () {
          Navigator.pop(Get.overlayContext!);
          showDriverInformationBottomSheet(
            driverName: "John Doe",
            sizeOfBox: "20 x 20",
            driverImage: Images.user_placeholder,
            allowChatandCallButton: true,
            endRideTab: () {
              launchScreen(const CancelRequestView());
            },
            onMessageTab: () {
              launchScreen(const ChatView());
            },
            driveDistance: "13 Km",
            arrivalTime: "15 min",
            totalPayment: "222",
            noOfHelpers: "2",
            destination: "Neemuch RD. Gopalbari, Bari Sad",
            location: "Neemuch RD. Gopalbari, Bari Sad",
            sizeOgBlock: "34 x 34",
          );
        },
        totalPayment: "2222",
        noOfHelpers: '2',
        destination: "Neemuch RD. Gopalbari, Bari Sad",
        location: "Neemuch RD. Gopalbari, Bari Sad",
        sizeOgBlock: "34 x 34",
      );
    });

    super.initState();
  }

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
          'Start Ride',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: FittedBox(
              fit: BoxFit.none,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: borderColor),
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                    onPressed: () {
                      launchScreen(CameraScreen());
                    },
                    icon: const Icon(
                      Iconsax.camera,
                    )),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            zoomControlsEnabled: false,
            initialCameraPosition: const CameraPosition(
              target: LatLng(37.7749, -122.4194),
              zoom: 12,
            ),
            onMapCreated: (controller) {
              controller.setMapStyle(mapStyle);
            },
          ),
        ],
      ),
    );
  }
}
