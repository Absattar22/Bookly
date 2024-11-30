import 'package:bookly/features/home/presentation/views/widgets/book_details_item.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_actions.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/related_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.h),
              child: const Column(
                children: [
                  CustomBookDetailsAppBar(),
                  BookDetailsItem(),
                  BooksActions(),
                  Expanded(
                    child: RelatedBooks(),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
