import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RelatedBooksSkeletonizer extends StatelessWidget {
  const RelatedBooksSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 12.h),
            child: Container(
              height: 150.h,
              width: 90.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16).w,
                color: const Color.fromARGB(255, 255, 255, 255),
                image: const DecorationImage(
                    fit: BoxFit.fill, image: NetworkImage('imgUrl')),
              ),
            ),
          );
        },
      ),
    );
  }
}
