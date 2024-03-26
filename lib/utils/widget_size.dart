// ignore_for_file: non_constant_identifier_names

import 'package:pallets_taxi_driver_pannel/common/responsive.dart';

class CustomSize {
  static int get restaurantCrossAxisCount => ResponsiveWidget.isTablet()
      ? 2
      : ResponsiveWidget.isWeb()
          ? 3
          : 1;

  // restaurant or store
  static double get restaurantChildAspectRatio => ResponsiveWidget.isTablet()
      ? 3.85
      : ResponsiveWidget.isWeb()
          ? 6.25
          : 4.4;

  // food or product
  static double get foodChildAspectRatio => ResponsiveWidget.isTablet()
      ? 2.80
      : ResponsiveWidget.isWeb()
          ? 5.25
          : 2.85;

  // category sheet
  static int get categoryCrossAxisCount => ResponsiveWidget.isTablet()
      ? 3
      : ResponsiveWidget.isWeb()
          ? 9
          : 3;

  static double get categoryChildAspectRatio => 1.1;

  // category sheet
  static int get restaurantInfoCrossAxisCount => ResponsiveWidget.isTablet()
      ? 3
      : ResponsiveWidget.isWeb()
          ? 4
          : 2;

  static double get restaurantInfoChildAspectRatio =>
      ResponsiveWidget.isTablet()
          ? 8
          : ResponsiveWidget.isWeb()
              ? 10
              : 5;

  // order widget
  static int get orderCrossAxisCount => ResponsiveWidget.isTablet()
      ? 2
      : ResponsiveWidget.isWeb()
          ? 3
          : 1;
  static double get orderChildAspectRatio => ResponsiveWidget.isTablet()
      ? 4.1
      : ResponsiveWidget.isWeb()
          ? 2.5
          : 1.6;

  // food and restaurant view height
  static double get foodHeight_H => ResponsiveWidget.isMobile() ? 180 : 250;
  static double get restaurantHeight_H =>
      ResponsiveWidget.isMobile() ? 175 : 210;

  // food and restaurant horizontal view image width and height
  static double get foodWidth_H => ResponsiveWidget.isMobile() ? 165 : 235;
  static double get foodImageHeight_H =>
      ResponsiveWidget.isMobile() ? 125 : 160;

  // food vertical view image width and height
  static double get foodImageWidth_V => ResponsiveWidget.isMobile() ? 135 : 195;
  static double get foodImageHeight_V =>
      ResponsiveWidget.isMobile() ? 115 : 155;

  // restaurant vertical view image width and height
  static double get restaurantImageWidth_V =>
      ResponsiveWidget.isMobile() ? 125 : 185;
  static double get restaurantImageHeight_V =>
      ResponsiveWidget.isMobile() ? 85 : 125;

  // category widget size
  static double get categoryWidgetSize =>
      ResponsiveWidget.isMobile() ? 80 : 110;

  // category image size
  static double get categoryImageSize => ResponsiveWidget.isMobile() ? 50 : 70;

  static double get spacing => 15;
}
