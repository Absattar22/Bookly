import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../features/home/presentation/views/widgets/custom_book_image.dart';

class NewestBooksSkeletonizer extends StatelessWidget {
  const NewestBooksSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: SizedBox(
        height: 500.h,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 12.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CustomBookImage(
                    height: 130,
                    width: 80,
                    imgUrl:
                        'https://books.google.com/books/content?id=150CEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
                  ),
                  SizedBox(width: 30.w),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Harry Potter and the Goblet of Fire',
                          style: Styles.textStyle20.copyWith(
                            fontFamily: 'Sectra',
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 3.h,
                        ),

                        // Author Name
                        Text(
                          'J.K. Rowling',
                          style: Styles.textStyle14,
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          children: [
                            // Price
                            Text(
                              '19.99 €',
                              style: Styles.textStyle20.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            const BookRating(
                              count: 500,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
