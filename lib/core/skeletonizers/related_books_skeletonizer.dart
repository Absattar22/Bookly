import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RelatedBooksSkeletonizer extends StatelessWidget {
  const RelatedBooksSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: SizedBox(
        height: 120.h,
        child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.only(right: 12.h),
                child: const CustomBookImage(
                  imgUrl:
                      'https://books.google.com/books/content?id=150CEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
                  width: 90,
                  height: 150,
                ));
          },
        ),
      ),
    );
  }
}
