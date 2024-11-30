import 'package:bookly/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BooksActions extends StatelessWidget {
  const BooksActions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: CustomButton(
            text: '19.19 €',
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
            fontSize: 16,
            text: 'Free Preview',
            backGroundColor: Color(0xffEF8262),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            textColor: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ],
    );
  }
}
