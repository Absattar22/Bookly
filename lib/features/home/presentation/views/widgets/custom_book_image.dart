import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage(
      {super.key,
      required this.imgUrl,
      required this.width,
      required this.height});

  final String imgUrl;
  final int width, height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: CachedNetworkImage(
        height: height.h,
        width: width.h,
        imageUrl: imgUrl,
        errorWidget: (context, url, error) => Container(
          color: Colors.grey.shade300,
          height: 170.h,
          width: 110.w,
          child: const Icon(Icons.error, color: Colors.red),
        ), // Error widget for failed image loading
        fit: BoxFit.fill,
      ),
    );
  }
}
