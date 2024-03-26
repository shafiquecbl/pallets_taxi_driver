import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pallets_taxi_driver_pannel/common/buttons.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/enums.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';

void showUploadDocBottomSheet({
  required UploadingStatus licenseStatus,
  required UploadingStatus idStatus,
  required UploadingStatus vehicleImageStatus,
  required UploadingStatus faceImageStatus,
  void Function()? uploadDrivingLicenseTab,
  void Function()? uploadIdTab,
  void Function()? uploadVehicleImageTab,
  void Function()? uploadFaceImageTab,
  void Function()? onSubmitTab,
}) {
  showModalBottomSheet(
    showDragHandle: true,
    context: Get.overlayContext!,
    clipBehavior: Clip.antiAlias,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (context) {
      return SizedBox(
        width: double.infinity,
        child: Padding(
          padding: pagePadding,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Upload All Requirments",
                ),
                const SizedBox(
                  height: 20,
                ),
                UploadDocContainer(
                  status: UploadingStatus.uploaded,
                  title: "Driving License",
                  subTitle: "A Driving license is an official document",
                  onTap: uploadDrivingLicenseTab,
                ),
                UploadDocContainer(
                  status: UploadingStatus.uploaded,
                  title: "Identity Card",
                  subTitle: "A Driving license is an official document",
                  onTap: uploadIdTab,
                ),
                UploadDocContainer(
                  status: UploadingStatus.uploaded,
                  title: "Driving License",
                  subTitle: "A Driving license is an official document",
                  onTap: uploadDrivingLicenseTab,
                ),
                UploadDocContainer(
                  status: UploadingStatus.uploaded,
                  title: "Identity Card",
                  subTitle: "A Driving license is an official document",
                  onTap: uploadIdTab,
                ),
                UploadDocContainer(
                  status: UploadingStatus.notUploaded,
                  title: "Vehicle Image",
                  subTitle: "A Driving license is an official document",
                  onTap: uploadVehicleImageTab,
                ),
                UploadDocContainer(
                  status: UploadingStatus.uploading,
                  title: "Your Face Image",
                  subTitle: "A Driving license is an official document",
                  onTap: uploadFaceImageTab,
                ),
                UploadDocContainer(
                  status: UploadingStatus.uploading,
                  title: "License Image",
                  subTitle: "Your vehicle license image",
                  onTap: uploadFaceImageTab,
                ),
                UploadDocContainer(
                  status: UploadingStatus.uploading,
                  title: "Vehicle Registration",
                  subTitle: "Your handbool image",
                  onTap: uploadFaceImageTab,
                ),
                UploadDocContainer(
                  status: UploadingStatus.uploading,
                  title: "Insurance document",
                  subTitle: "Your handbool image",
                  onTap: uploadFaceImageTab,
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    child: CustomMaterialButton(
                      text: "Submit",
                      ontab: onSubmitTab,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

class UploadDocContainer extends StatelessWidget {
  final String title;
  final String subTitle;
  final UploadingStatus status;
  final void Function()? onTap;
  const UploadDocContainer(
      {super.key,
      required this.title,
      required this.subTitle,
      this.onTap,
      required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(15)),
      child: SingleChildScrollView(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 18),
                ),
                Text(
                  subTitle,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            IconButton.filled(
                onPressed: () {},
                color: status == UploadingStatus.notUploaded
                    ? Colors.grey
                    : primaryColor,
                icon: status == UploadingStatus.uploaded
                    ? const Icon(
                        Icons.check,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.file_upload_outlined,
                        color: Colors.white,
                      ))
          ],
        ),
      ),
    );
  }
}
