import 'package:bookly/core/skeletonizers/related_books_skeletonizer.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/features/home/presentation/view%20model/related_books_cubit/related_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RelatedBooksListView extends StatelessWidget {
  const RelatedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RelatedBooksCubit, RelatedBooksState>(
      builder: (context, state) {
        if (state is RelatedBooksSuccess) {
          return SizedBox(
            height: 120.h,
            child: ListView.builder(
              itemCount: state.books.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                    padding: EdgeInsets.only(right: 12.h),
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kBookDetails,
                            extra: state.books[index]);
                      },
                      child: CustomBookImage(
                          height: 150,
                          width: 90,
                          imgUrl: state.books[index].volumeInfo.imageLinks
                                  ?.thumbnail ??
                              ''),
                    ));
              },
            ),
          );
        } else if (state is RelatedBooksFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else {
          return const RelatedBooksSkeletonizer();
        }
      },
    );
  }
}
