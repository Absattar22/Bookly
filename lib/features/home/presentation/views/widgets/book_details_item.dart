import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BookDetailsItem extends StatelessWidget {
  const BookDetailsItem({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRouter.kBookDetails,
          extra: book,
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomBookImage(
              height: 190,
              width: 150,
              imgUrl: book.volumeInfo.imageLinks?.thumbnail ?? '',
            ),
            SizedBox(height: 25.h),
            Center(
              child: Text(
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                book.volumeInfo.title ?? '',
                style: Styles.textStyle24.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 2.h),
            Center(
              child: Text(
                textAlign: TextAlign.center,
                book.volumeInfo.authors?[0] ?? '',
                style: Styles.textStyle18.copyWith(
                    color: const Color.fromARGB(255, 189, 188, 188),
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic),
              ),
            ),
            BookRating(count: book.volumeInfo.pageCount)
          ],
        ),
      ),
    );
  }
}
