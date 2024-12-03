import 'package:bookly/core/utils/random_number.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, required this.count});
  final int count;

  @override
  Widget build(BuildContext context) {
    double rating = getRandomDouble(3, 5);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.star,
          color: Color.fromARGB(255, 246, 222, 6),
        ),
        SizedBox(width: 4.w),
        Text(
          rating.toStringAsFixed(1),
          style: Styles.textStyle16
              .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        SizedBox(width: 4.w),
        Text(
          '($count)',
          style: Styles.textStyle14
              .copyWith(color: const Color.fromARGB(255, 172, 171, 171)),
        ),
      ],
    );
  }
}
