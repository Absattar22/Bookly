import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';

class SlidingImage extends StatefulWidget {
  const SlidingImage({super.key});

  @override
  State<SlidingImage> createState() => _SlidingImageState();
}

class _SlidingImageState extends State<SlidingImage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: const Offset(0, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.fastEaseInToSlowEaseOut,
    ));

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, child) {
        return SlideTransition(
          position: slidingAnimation,
          child: Image.asset(
            AssestData.logoPng,
          ),
        );
      },
    );
  }
}
