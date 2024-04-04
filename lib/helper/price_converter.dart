import 'package:flutter/material.dart';
import 'package:pallets_taxi_driver_pannel/controller/spash_controller.dart';
import 'package:pallets_taxi_driver_pannel/data/model/response/app_setting.dart';

class PriceConverter {
  static String convertPrice(double? price) {
    CurrencySetting currencySetting =
        SplashController.find.appSetting!.currencySetting;

    String convertedPrice = '';
    if (currencySetting.position == 'left') {
      convertedPrice = '${currencySetting.symbol} ${price!.toStringAsFixed(2)}';
    } else {
      convertedPrice = '${price!.toStringAsFixed(2)} ${currencySetting.symbol}';
    }
    return convertedPrice;
  }

  static double? convertWithDiscount(
      double? price, double? discount, String? discountType) {
    if (discountType == 'amount') {
      price = price! - discount!;
    } else if (discountType == 'percent') {
      price = price! - ((discount! / 100) * price);
    }
    return price;
  }

  static double? convertDiscount(BuildContext context, double? price,
      double? discount, String? discountType) {
    if (discountType == 'amount') {
      price = discount;
    } else if (discountType == 'percent') {
      price = (discount! / 100) * price!;
    }
    return price;
  }

  static double calculation(
      double amount, double discount, String type, int quantity) {
    double calculatedAmount = 0;
    if (type == 'amount') {
      calculatedAmount = discount * quantity;
    } else if (type == 'percent') {
      calculatedAmount = (discount / 100) * (amount * quantity);
    }
    return calculatedAmount;
  }
}
