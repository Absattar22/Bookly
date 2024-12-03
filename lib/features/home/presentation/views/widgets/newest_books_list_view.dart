import 'package:bookly/core/skeletonizers/newest_books_skeletonizer.dart';
import 'package:bookly/features/home/presentation/view%20model/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/newest_books_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess && state.books.isNotEmpty) {
          return SliverList.builder(
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return NewestBooksListViewItem(
                book: state.books[index],
              );
            },
          );
        } else if (state is NewestBooksError) {
          return SliverToBoxAdapter(
              child: Center(
            child: Text(
              state.errMessage,
              style: TextStyle(color: Colors.red, fontSize: 16.sp),
            ),
          ));
        } else {
          return const SliverToBoxAdapter(
            child: NewestBooksSkeletonizer(),
          );
        }
      },
    );
  }
}
