import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/features/home/presentation/view%20model/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly/core/skeletonizers/skeletonizer_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FeatureListView extends StatelessWidget {
  const FeatureListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksFailure) {
          return Center(
            child: Text(
              state.errMessage,
              style: TextStyle(color: Colors.red, fontSize: 16.sp),
            ),
          );
        } else if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: 170.h,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final thumbnail =
                    state.books[index].volumeInfo.imageLinks?.thumbnail ?? '';
                return Padding(
                  padding: EdgeInsets.all(8.w),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kBookDetails,
                          extra: state.books[index]);
                    },
                    child: CustomBookImage(
                      height: 170,
                      width: 110,
                      imgUrl: thumbnail,
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return const SkeletonizerBookImage();
        }
      },
    );
  }
}
