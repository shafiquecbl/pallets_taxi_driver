import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';
import 'package:shimmer/shimmer.dart';

class CustomNetworkImage extends StatefulWidget {
  final String? url;
  final bool isProfile;
  final BoxFit fit;
  final bool isRounded;
  final double? height;
  final double? width;
  final bool isBordered;
  final double loadingRadius;
  const CustomNetworkImage(
      {required this.url,
      this.isProfile = false,
      this.fit = BoxFit.cover,
      this.loadingRadius = 0,
      Key? key,
      this.isRounded = false,
      this.height,
      this.width,
      this.isBordered = false})
      : super(key: key);

  @override
  State<CustomNetworkImage> createState() => _CustomNetworkImageState();
}

class _CustomNetworkImageState extends State<CustomNetworkImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
          shape: widget.isRounded ? BoxShape.circle : BoxShape.rectangle,
          border: widget.isBordered
              ? Border.all(
                  color: primaryColor,
                )
              : null),
      child: CachedNetworkImage(
        imageUrl: "${widget.url}",
        fit: BoxFit.cover,
        placeholder: (c, s) {
          return ClipRRect(
              borderRadius: BorderRadius.circular(widget.loadingRadius),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  color: Colors.grey[300],
                ),
              ));
        },
        errorWidget: (c, s, o) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.loadingRadius),
              color: Theme.of(context).cardColor,
            ),
            child: Icon(
              Icons.image_outlined,
              size: 40,
              color: Theme.of(context).hintColor,
            ),
          );
        },
      ),
    );
  }
}
