import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/feature_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomAppBar(),
        const FeatureListView(),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8).w,
          child: Text(
            'Best Seller',
            style: Styles.titleMedium,
          ),
        )
      ],
    );
  }
}
