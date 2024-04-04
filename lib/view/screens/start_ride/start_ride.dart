import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pallets_taxi_driver_pannel/common/buttons.dart';
import 'package:pallets_taxi_driver_pannel/controller/ride_controller.dart';
import 'package:pallets_taxi_driver_pannel/data/model/response/ride_request.dart';
import 'package:pallets_taxi_driver_pannel/view/base/expandable_sheet.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/start_ride/widgets/ride_request_widget.dart';

class RideScreen extends StatefulWidget {
  const RideScreen({Key? key}) : super(key: key);

  @override
  State<RideScreen> createState() => _RideScreenState();
}

class _RideScreenState extends State<RideScreen> {
  bool endRide = false;
  GlobalKey<ExpandableBottomSheetState> key = GlobalKey();
  late GoogleMapController mapController;

  @override
  void initState() {
    super.initState();
    // _getCurrentLocation();
  }

  // _getCurrentLocation() async {
  //   try {
  //     final position = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.bestForNavigation);

  //     //
  //     final LatLng pos = LatLng(position.latitude, position.longitude);

  //     //
  //     mapController.animateCamera(CameraUpdate.newCameraPosition(
  //         CameraPosition(target: pos, zoom: 15)));

  //     //
  //     MapsRepo.instance.getMarkers(pos).then((value) {
  //       RideController.find.markers = value;
  //     });
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RideController>(builder: (con) {
      RideRequest ride = con.rideRequest!;
      OnRideRequest data = ride.onRideRequest!;
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: kToolbarHeight * 1.2,
          leading: const CustomBackButton(),
          title: Text(
            'Start Ride',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        body: ExpandableBottomSheet(
          key: key,
          animationDurationExtend: const Duration(milliseconds: 250),
          animationDurationContract: const Duration(milliseconds: 250),
          persistentContentHeight: 370.sp,
          isDraggable: true,
          // This is the background of the bottom sheet.
          background: GoogleMap(
            mapType: MapType.normal,
            zoomControlsEnabled: false,
            myLocationEnabled: true,
            initialCameraPosition: const CameraPosition(
              target: LatLng(37.7749, -122.4194),
              zoom: 12,
            ),
            onMapCreated: (controller) {
              mapController = controller;
            },
            markers: con.markers,
          ),

          //This is the content of the bottom sheet which will be extendable by dragging.
          expandableContent: RideRequestSheet(ride: data),
        ),
      );
    });
  }
}
