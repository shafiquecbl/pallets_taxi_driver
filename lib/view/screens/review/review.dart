import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pallets_taxi_driver_pannel/common/buttons.dart';
import 'package:pallets_taxi_driver_pannel/common/textfield.dart';
import 'package:pallets_taxi_driver_pannel/controller/ride_controller.dart';
import 'package:pallets_taxi_driver_pannel/data/model/response/ride_request.dart';
import 'package:pallets_taxi_driver_pannel/helper/navigation.dart';
import 'package:pallets_taxi_driver_pannel/utils/style.dart';
import 'package:pallets_taxi_driver_pannel/view/base/primary_button.dart';
import 'package:pallets_taxi_driver_pannel/view/screens/ride_details/ride_details.dart';

class RatingScreen extends StatefulWidget {
  final OnRideRequest ride;
  const RatingScreen({required this.ride, super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double rating = 5;
  final comment = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text(
          'Rate your ride',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: false,
      ),
      body: Form(
        key: _formKey,
        child: ListView(padding: pagePadding, children: [
          Text(
            'How was your ride with ${widget.ride.riderName}?',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 20.sp),
          Center(
            child: RatingBar(
              onRatingUpdate: (rating) {
                setState(() {
                  this.rating = rating;
                });
              },
              itemSize: 40.sp,
              allowHalfRating: true,
              initialRating: rating,
              itemCount: 5,
              ratingWidget: RatingWidget(
                full: const Icon(Icons.star, color: Colors.amber),
                half: const Icon(Icons.star_half, color: Colors.amber),
                empty: const Icon(Icons.star_border, color: Colors.amber),
              ),
            ),
          ),
          SizedBox(height: 32.sp),
          Text(
            'Leave a comment',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 10.sp),
          CustomTextField(
            controller: comment,
            hintText: 'Write your comment here',
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your comment';
              }
              return null;
            },
          ),
        ]),
      ),
      bottomNavigationBar: Padding(
        padding: pagePadding,
        child: PrimaryButton(
          text: 'Continue',
          onPressed: () {
            RideRequest request = RideController.find.rideRequest!;
            if (_formKey.currentState!.validate()) {
              RideController.find
                  .saveRideRating(rating, comment.text)
                  .then((value) {
                if (value.isSuccess) {
                  pop();
                  launchScreen(RideDetailScreen(request: request));
                }
              });
            }
          },
        ),
      ),
    );
  }
}
