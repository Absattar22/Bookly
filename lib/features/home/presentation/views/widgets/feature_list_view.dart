import 'package:bookly/features/home/presentation/view%20model/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
            height: 180.h,
            child: ListView.builder(
              itemCount: state.books.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.w),
                  child: const CustomBookItem(),
                );
              },
            ),
          );
        }
        return SizedBox(
          height: 180.h,
          child: ListView.builder(
            itemCount: 20,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(8.w),
                child: const Skeletonizer(
                  child: CustomBookItem(),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
