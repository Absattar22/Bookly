import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchBooksSkeletonizer extends StatelessWidget {
  const SearchBooksSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        child: ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.only(
        left: 8.w,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomBookImage(
                height: 190,
                width: 150,
                imgUrl:
                    'https://books.google.com/books/content?id=150CEAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
              ),
              SizedBox(height: 35.h),
              Center(
                child: Text(
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  'harry potter',
                  style: Styles.textStyle24.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              Center(
                child: Text(
                  textAlign: TextAlign.center,
                  'Mostafa Mahmoud',
                  style: Styles.textStyle18.copyWith(
                      color: const Color.fromARGB(255, 189, 188, 188),
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic),
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              const BookRating(count: 3500)
            ],
          ),
        );
      },
    ));
  }
}
