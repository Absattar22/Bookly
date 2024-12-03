import 'package:bookly/core/skeletonizers/related_books_skeletonizer.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/features/home/presentation/view%20model/related_books_cubit/related_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                  child: Container(
                    height: 150.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16).w,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      image: const DecorationImage(
                          fit: BoxFit.fill, image: NetworkImage('imgUrl')),
                    ),
                  ),
                );
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
