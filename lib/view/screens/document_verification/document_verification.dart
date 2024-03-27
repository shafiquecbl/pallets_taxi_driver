import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pallets_taxi_driver_pannel/common/buttons.dart';
import 'package:pallets_taxi_driver_pannel/common/network_image.dart';
import 'package:pallets_taxi_driver_pannel/controller/document_controller.dart';
import 'package:pallets_taxi_driver_pannel/controller/profile_controller.dart';
import 'package:pallets_taxi_driver_pannel/data/model/response/document_model.dart';
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';

class DocumentVerificationScreen extends StatefulWidget {
  const DocumentVerificationScreen({super.key});

  @override
  State<DocumentVerificationScreen> createState() =>
      _DocumentVerificationScreenState();
}

class _DocumentVerificationScreenState
    extends State<DocumentVerificationScreen> {
  @override
  void initState() {
    if (DocumentController.find.documents.isEmpty) {
      ProfileController.find.getProfile();
    }
    DocumentController.find.getSubmittedDocuments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70.sp,
        leading: const CustomBackButton(),
        title: const Text('Document Verification'),
      ),
      body: GetBuilder<DocumentController>(builder: (con) {
        return con.loading
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                padding: pagePadding,
                children: [
                  for (int i = 0; i < con.submittedDocuments.length; i++)
                    DocumentsContainerAddRemove(
                      document: con.submittedDocuments[i],
                      index: i,
                      con: con,
                    ),
                  for (int i = 0; i < con.documents.length; i++)
                    DocumentsContainerAddRemove(
                      model: con.documents[i],
                      index: i,
                      con: con,
                    )
                ],
              );
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: CustomMaterialButton(
          text: "Go to Dashboard",
          ontab: () {
            final user = ProfileController.find.userModel;
            goToDashboard(user);
          },
        ),
      ),
    );
  }
}

class DocumentsContainerAddRemove extends StatelessWidget {
  final SubmittedDocument? document;
  final DocumentModel? model;
  final int index;
  final DocumentController con;
  const DocumentsContainerAddRemove(
      {super.key,
      this.document,
      this.model,
      required this.index,
      required this.con});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.sp),
      width: double.infinity,
      padding: EdgeInsets.all(15.sp),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(defautSpacing / 2),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    text: model != null ? model?.name : document?.documentName,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: ' *',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
              CircularIconButton(
                iconColor: Colors.white,
                backgroundColor: primaryColor,
                icon: document != null ? Iconsax.edit : Icons.upload,
                onTap: _pickMultipleImages,
              ),
            ],
          ),
          if (document != null) SizedBox(height: 5.sp),
          if (document != null)
            AspectRatio(
              aspectRatio: 1.7.sp,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5.sp, right: 5.sp),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(defautSpacing),
                      child: CustomNetworkImage(url: document?.image),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  // pick multiple images
  _pickMultipleImages() async {
    ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 70)
        .then((value) {
      if (value != null) {
        con.submitDocument(value, model != null ? model!.id : document!.id);
      }
    });
  }
}

class CircularIconButton extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final Color iconColor;
  final void Function()? onTap;

  const CircularIconButton({
    Key? key,
    required this.backgroundColor,
    required this.icon,
    required this.onTap,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(6.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.sp), color: backgroundColor),
        child: Center(
          child: Icon(icon, color: iconColor, size: 20.sp),
        ),
      ),
    );
  }
}
