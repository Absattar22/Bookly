import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Color.fromARGB(255, 246, 222, 6),
        ),
        SizedBox(width: 4.w),
        Text(
          '4.8',
          style: Styles.textStyle16
              .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        SizedBox(width: 4.w),
        Text(
          '(2300)',
          style: Styles.textStyle14
              .copyWith(color: const Color.fromARGB(255, 172, 171, 171)),
        ),
      ],
    );
  }
}
