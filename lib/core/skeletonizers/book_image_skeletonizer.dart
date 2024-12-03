import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BookImageSkeletonizer extends StatelessWidget {
  const BookImageSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: SizedBox(
        height: 180.h,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(8.w),
              child: const CustomBookImage(
                height: 170,
                width: 110,
                imgUrl:
                    'https://books.google.com/books/content?id=150CEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
              ),
            );
          },
        ),
      ),
    );
  }
}
