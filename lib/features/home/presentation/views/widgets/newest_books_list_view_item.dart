import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class NewestBooksListViewItem extends StatelessWidget {
  const NewestBooksListViewItem({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetails, extra: bookModel);
      },
      child: SizedBox(
        height: 160.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: CachedNetworkImage(
                  height: 130.h,
                  width: 100.w,
                  imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey.shade300,
                    height: 130.h,
                    width: 100.w,
                    child: const Icon(Icons.error, color: Colors.red),
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(width: 30.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bookModel.volumeInfo.title!,
                      style: Styles.textStyle20.copyWith(fontFamily: 'Sectra'),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      bookModel.volumeInfo.authors![0],
                      style: Styles.textStyle14,
                    ),
                    SizedBox(height: 3.h),
                    Row(
                      children: [
                        Text(
                          'Free',
                          style: Styles.textStyle18.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        BookRating(
                          count: bookModel.volumeInfo.pageCount,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
