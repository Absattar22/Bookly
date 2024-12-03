import 'package:bookly/core/functions/launch_url.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:bookly/features/home/data/model/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BooksActions extends StatelessWidget {
  const BooksActions({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.h),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
              text: 'Free',
              backGroundColor: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              textColor: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () async {
                await launchCustomUrl(
                    context, bookModel.volumeInfo.previewLink);
              },
              fontSize: 16,
              text: getText(bookModel),
              backGroundColor: const Color(0xffEF8262),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              textColor: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ],
      ),
    );
  }

  String getText(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return 'Not available';
    } else {
      return 'Preview';
    }
  }
}
