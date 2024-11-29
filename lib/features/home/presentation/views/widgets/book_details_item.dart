import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsItem extends StatelessWidget {
  const BookDetailsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomBookItem(),
          SizedBox(height: 30.h),
          Text(
            'The Jungle Book',
            style: Styles.textStyle30.copyWith(color: Colors.white),
          ),
          SizedBox(height: 6.h),
          Text(
            ' J.K. Rowling',
            style: Styles.textStyle18.copyWith(
                color: const Color.fromARGB(255, 189, 188, 188),
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 6.h,
          ),
          const BookRating()
        ],
      ),
    );
  }
}
