import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pallets_taxi_driver_pannel/common/buttons.dart';
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';
import 'package:pallets_taxi_driver_pannel/utils/images.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';
import 'package:pallets_taxi_driver_pannel/view/base/expandable_sheet.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/cancel_request/cancel_request.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/start_ride/widgets/ride_request_widget.dart';

class StartRideScreen extends StatefulWidget {
  const StartRideScreen({Key? key}) : super(key: key);

  @override
  State<StartRideScreen> createState() => _StartRideScreenState();
}

class _StartRideScreenState extends State<StartRideScreen> {
  bool endRide = false;
  GlobalKey<ExpandableBottomSheetState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight * 1.2,
        leading: const CustomBackButton(),
        title: Text(
          endRide ? "End Ride" : 'Start Ride',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          if (endRide)
            TextButton(
              onPressed: () => launchScreen(const CancelRequestScreen()),
              child: Text(
                'Cancel',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold, color: Colors.red),
              ),
            ),
          SizedBox(width: 5.sp),
        ],
      ),
      body: ExpandableBottomSheet(
        key: key,
        animationDurationExtend: const Duration(milliseconds: 250),
        animationDurationContract: const Duration(milliseconds: 250),
        persistentContentHeight: 120.sp,
        isDraggable: true,
        // This is the background of the bottom sheet.
        background: GoogleMap(
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

        //This is the content of the bottom sheet which will be extendable by dragging.
        expandableContent: RideRequestSheet(
          arrivalTime: "(5 mins away)",
          driveDistance: "800 m",
          driverImage: Images.user_placeholder,
          sizeOfBox: '20 x 20',
          driverName: "John Doe",
          totalPayment: "2222",
          noOfHelpers: '2',
          destination: "Neemuch RD. Gopalbari, Bari Sad",
          location: "Neemuch RD. Gopalbari, Bari Sad",
          sizeOgBlock: "34 x 34",
          endRide: endRide,
          onAction: () {
            setState(() {
              endRide = !endRide;
            });
          },
        ),
      ),
    );
  }
}
