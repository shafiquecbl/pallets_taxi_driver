import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/dashboard/dashboard_screen.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/location/widgets/location_bottom_sheets.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(
        const Duration(seconds: 3),
        () {
          showLocationDialog(onTab: () {
            launchScreen(const DashboardScreen());
          });
        },
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        zoomControlsEnabled: false,
        initialCameraPosition:
            const CameraPosition(target: LatLng(37.7749, -122.4194), zoom: 12),
        onMapCreated: (controller) {
          controller.setMapStyle(mapStyle);
        },
      ),
    );
  }
}
