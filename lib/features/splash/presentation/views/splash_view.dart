import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Bookly App' , style: TextStyle(
        fontSize: 20.sp,
      ),),
    );
  }
}
