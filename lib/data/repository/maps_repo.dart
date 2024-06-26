// ignore_for_file: depend_on_referenced_packages, unused_import, prefer_final_fields

import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pallets_taxi_driver_pannel/utils/app_constants.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/images.dart';

class MapsRepo {
  MapsRepo._();
  static final MapsRepo instance = MapsRepo._();

  // markes

  Future<Set<Marker>> getMarkers(LatLng pos) async {
    final user = await convertAssetToUnit8List(Images.userMarker, width: 120);
    Set<Marker> markers = <Marker>{};
    markers.add(Marker(
      markerId: const MarkerId('user'),
      position: pos,
      icon: BitmapDescriptor.fromBytes(user),
    ));

    return markers;
  }

  Future<Uint8List> convertAssetToUnit8List(String imagePath,
      {int width = 50}) async {
    ByteData data = await rootBundle.load(imagePath);
    Codec codec = await instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: width,
      targetHeight: 150,
    );
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  // polylines
  Future<Set<Polyline>> getPolyline(LatLng start, LatLng end) async {
    Set<Polyline> polylines = {};
    PolylineResult result = await PolylinePoints().getRouteBetweenCoordinates(
      AppConstants.API_KEY,
      PointLatLng(
        start.latitude,
        start.longitude,
      ),
      PointLatLng(end.latitude, end.longitude),
    );

    if (result.points.isNotEmpty) {
      final List<LatLng> polylineCoordinates = [];
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }

      polylines.add(Polyline(
        polylineId: const PolylineId("path"),
        color: primaryColor,
        width: 5,
        points: polylineCoordinates,
      ));
    }
    return polylines;
  }

  // get distance in KM
  double getDistance(LatLng start, LatLng end) {
    double distanceInMeters = Geolocator.distanceBetween(
      start.latitude,
      start.longitude,
      end.latitude,
      end.longitude,
    );
    return double.parse((distanceInMeters / 1000).toStringAsFixed(2));
  }

  CameraPosition getCameraPosition(LatLng start, LatLng end) {
    LatLngBounds bounds = LatLngBounds(
      southwest: LatLng(min(start.latitude, end.latitude),
          min(start.longitude, end.longitude)),
      northeast: LatLng(max(start.latitude, end.latitude),
          max(start.longitude, end.longitude)),
    );

    double centerLatitude =
        (bounds.southwest.latitude + bounds.northeast.latitude) / 2;
    double centerLongitude =
        (bounds.southwest.longitude + bounds.northeast.longitude) / 2;

    CameraPosition cameraPosition = CameraPosition(
      target: LatLng(centerLatitude, centerLongitude),
      zoom: fitBoundsZoomLevel(bounds).toDouble(),
    );

    return cameraPosition;
  }

  num fitBoundsZoomLevel(LatLngBounds bounds) {
    double globeWidth =
        256; // Google Maps global width in pixels at zoom level 0
    int zoomMax = 21;

    double latDiff = bounds.northeast.latitude - bounds.southwest.latitude;
    double lngDiff = bounds.northeast.longitude - bounds.southwest.longitude;

    double latZoom = log(globeWidth * 360 / (256 * latDiff)) / ln2;
    double lngZoom = log(globeWidth * 360 / (256 * lngDiff)) / ln2;

    double result = min(latZoom, lngZoom);

    // Calculate desired zoom level based on map height
    double heightZoom = log(300 * 360 / (256 * latDiff)) / ln2;

    return (min(result, heightZoom) > zoomMax
        ? zoomMax
        : min(result, heightZoom));
  }
}
