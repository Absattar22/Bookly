import 'package:bookly/core/skeletonizers/search_books_skeletonizer.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_item.dart';
import 'package:bookly/features/search/view%20model/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchReslutListView extends StatelessWidget {
  const SearchReslutListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.only(
              left: 8.w,
            ),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return BookDetailsItem(
                book: state.books[index],
              );
            },
          );
        } else if (state is SearchBooksFailure) {
          return SizedBox(
            height: 200.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/search.png',
                  height: 200.h,
                ),
              ],
            ),
          );
        } else if (state is SearchBooksLoading) {
          return const SearchBooksSkeletonizer();
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
