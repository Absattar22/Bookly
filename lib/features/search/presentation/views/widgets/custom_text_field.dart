import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.onChanged,
  });

  final Function(String)? onChanged;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 8.w,
            right: 8.w,
            bottom: 8.h,
          ),
          child: TextField(
            style: const TextStyle(
              color: Colors.white,
            ),
            controller: controller,
            onChanged: widget.onChanged,
            cursorColor: Colors.white,
            autocorrect: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromARGB(255, 30, 30, 30),
              contentPadding: EdgeInsets.symmetric(
                vertical: 15.h,
                horizontal: 10.w,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 21, 123, 40),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 43, 41, 56),
                ),
              ),
              hintText: 'Enter book title',
              hintStyle: const TextStyle(
                color: Color.fromARGB(255, 126, 126, 126),
              ),
              labelStyle: const TextStyle(
                color: Colors.white,
              ),
              prefixIcon: Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 15.w,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                icon: Icon(
                  Icons.close,
                  size: 20.w,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
