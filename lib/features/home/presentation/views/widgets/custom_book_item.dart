import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBookItem extends StatelessWidget {
  const CustomBookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      width: 130.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16).w,
        color: Colors.red,
        image: const DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            AssestData.testImage,
          ),
        ),
      ),
    );
  }
}
