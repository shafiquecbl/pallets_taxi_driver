import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:pallets_taxi_driver_pannel/common/buttons.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:pallets_taxi_driver_pannel/utils/images.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/start_ride/widgets/bottom_sheets.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  bool isCapturing = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  void _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    _controller = CameraController(firstCamera, ResolutionPreset.medium);
    await _controller!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((error) {
      print('Error initializing camera: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      body: Stack(
        children: [
          //// camera preview

          SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: CameraPreview(_controller!)),

          //// app bar
          ///
          Align(
            alignment: Alignment.topLeft,
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15))),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: borderColor),
                          borderRadius: BorderRadius.circular(10)),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios_new_sharp)),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.15),
                    Text(
                      'Take Picture',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontSize: 24),
                    ),
                  ],
                )),
          ),

          Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: CustomMaterialButton(
                      text: " Capture ",
                      ontab: () {
                        _capturePhoto();
                        Future.delayed(const Duration(seconds: 2), () {
                          showDriverInformationBottomSheet(
                            driverName: "John Doe",
                            sizeOfBox: "20 x 20",
                            driverImage: Images.user_placeholder,
                            allowChatandCallButton: true,
                            endRideTab: () {},
                            driveDistance: "13 Km",
                            arrivalTime: "15 min",
                            totalPayment: "222",
                            noOfHelpers: "2",
                            destination: "Neemuch RD. Gopalbari, Bari Sad",
                            location: "Neemuch RD. Gopalbari, Bari Sad",
                            sizeOgBlock: "34 x 34",
                          );
                        });
                      }),
                ),
              )),
        ],
      ),
    );
  }

  Future<void> _capturePhoto() async {
    try {
      setState(() {
        isCapturing = true;
      });

      final path = join(
        (await getTemporaryDirectory()).path,
        '${DateTime.now()}.jpg',
      );
      await _controller!
          .takePicture()
          .then((value) => saveXFileToTempDirectory(File(value.path)));

      setState(() {
        isCapturing = false;
      });

      saveXFileToTempDirectory(File(path));
    } catch (e) {
      print('Error capturing photo: $e');
    }
  }
}

Future<void> saveXFileToTempDirectory(File file) async {
  try {
    Directory tempDir = await getTemporaryDirectory();

    String fileName = file.path.split('/').last;

    File newFile = await file.copy('${tempDir.path}/$fileName');

    print('File saved successfully to ${newFile.path}');
  } catch (e) {
    print('Error saving file: $e');
  }
}
