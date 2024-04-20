import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pallets_taxi_driver_pannel/common/buttons.dart';
import 'package:pallets_taxi_driver_pannel/common/network_image.dart';
import 'package:pallets_taxi_driver_pannel/controller/ride_controller.dart';
import 'package:pallets_taxi_driver_pannel/data/model/response/ride_request.dart';
import 'package:pallets_taxi_driver_pannel/helper/date_converter.dart';
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';
import 'package:pallets_taxi_driver_pannel/helper/price_converter.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';
import 'package:pallets_taxi_driver_pannel/view/base/address_widget.dart';
import 'package:pallets_taxi_driver_pannel/view/base/confirmation_dialog.dart';
import 'package:pallets_taxi_driver_pannel/view/base/divider.dart';
import 'package:pallets_taxi_driver_pannel/view/base/primary_button.dart';
import 'widgets/receipt_tile.dart';

class RideDetailScreen extends StatelessWidget {
  final RideRequest? request;
  final OnRideRequest? ride;
  const RideDetailScreen({this.request, this.ride, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OnRideRequest data = ride ?? request!.onRideRequest!;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight * 1.2,
        leading: const CustomBackButton(),
        title: Text(
          'Shipment #${data.id}',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: false,
      ),
      body: ListView(
        padding: pagePadding,
        children: [
          AddressWidget(end: data.endAddress, start: data.startAddress),
          SizedBox(height: 32.sp),
          Row(
            children: [
              CircleAvatar(
                radius: 30.sp,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(40.sp),
                    child: CustomNetworkImage(url: data.riderProfileImage)),
              ),
              SizedBox(width: 16.sp),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.riderName ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5.sp),
                    Wrap(
                      children: [
                        Icon(Icons.phone, size: 16.sp),
                        Text(
                          data.riderContactNumber ?? '',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 32.sp),
          Text(
            'Details',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          CustomDivider(padding: 8.sp),
          SizedBox(height: 8.sp),
          ReceiptTile(title: "Weight", value: data.weight),
          ReceiptTile(title: "Dimensions:", value: data.dimensions),
          ReceiptTile(title: "Addons", value: "${data.helpers} Helpers"),
          ReceiptTile(
            title: "Shipment",
            value: data.isUrgent ? "Urgent" : "Normal",
          ),
          const ReceiptTile(title: "Payment", value: "COD"),
          ReceiptTile(
            title: "Start Date",
            value: DateConverter.formatDate(data.startDate),
          ),
          ReceiptTile(
            title: "End Date",
            value: DateConverter.formatDate(data.endDate),
          ),
          ReceiptTile(
            title: "Distance",
            value: "${data.distance} miles",
          ),
          CustomDivider(padding: 10.sp),
          ReceiptTile(
            title: "Total",
            value: PriceConverter.convertPrice(data.totalAmount.toDouble()),
            total: true,
          ),
        ],
      ),
      bottomNavigationBar: ride != null
          ? const SizedBox()
          : Padding(
              padding: pagePadding,
              child: PrimaryButton(
                text: 'Collect Cash',
                onPressed: () {
                  showConfirmationDialog(
                    title: 'Collect Cash',
                    subtitle:
                        'Have you collected ${PriceConverter.convertPrice(data.totalAmount.toDouble())} from the rider?',
                    actionText: 'Collected',
                    onAccept: () {
                      pop();
                      RideController.find.savePayment(request!).then((value) {
                        if (value.isSuccess) {
                          pop();
                        }
                      });
                    },
                  );
                },
              )),
    );
  }
}
