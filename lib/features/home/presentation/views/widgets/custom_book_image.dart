import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imgUrl});

  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: CachedNetworkImage(
        height: 140.h,
        width: 140.w,
        imageUrl: imgUrl,
        errorWidget: (context, url, error) => Container(
          color: Colors.grey.shade300,
          height: 180.h,
          width: 140.w,
          child: const Icon(Icons.error, color: Colors.red),
        ), // Error widget for failed image loading
        fit: BoxFit.fill,
      ),
    );
  }
}
