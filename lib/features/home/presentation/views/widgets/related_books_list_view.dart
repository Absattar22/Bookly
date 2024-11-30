import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RelatedBooksListView extends StatelessWidget {
  const RelatedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: ListView.builder(
        itemCount: 20,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8).w,
            child: Container(
              height: 150.h,
              width: 80.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16).w,
                color: const Color.fromARGB(255, 255, 255, 255),
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    AssestData.testImage,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
