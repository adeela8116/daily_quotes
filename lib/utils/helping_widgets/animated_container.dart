import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/routes/app_pages.dart';

class CustomAnimatedContainer extends StatefulWidget {
  const CustomAnimatedContainer({super.key});

  @override
  State<CustomAnimatedContainer> createState() => _CustomAnimatedContainerState();
}

class _CustomAnimatedContainerState extends State<CustomAnimatedContainer> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<Color?> colorAnimation;
  late Animation<double> sizeAnimation;
  late Animation<double> rotationAnimation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Transform.rotate(
            angle: rotationAnimation.value,
            child: Container(
              width: sizeAnimation.value,
              height: sizeAnimation.value,
              decoration: BoxDecoration(
                // color: colorAnimation.value,
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/main/logo.png'),

                  // Row(
                  //   children: [
                  //     Flexible(
                  //       child: Text(
                  //         'Start your day with a spark of wisdom.',
                  //         style: TextStyle(fontSize: sizeAnimation.value*0.035, color: colorAnimation.value, fontWeight: FontWeight.w400),
                  //       ),
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ),
          );
        },
      ),
    );
  }


  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    colorAnimation = ColorTween(
      begin: Colors.blueAccent,
      end: Colors.deepPurple,
    ).animate(animationController);

    sizeAnimation = Tween<double>(
      begin: 40.0,
      end: 380.0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));


    rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 2 * 3.1416, // Full circle (360 degrees)
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));

    animationController.forward();

    Future.delayed(const Duration(seconds: 8), () {
      Get.toNamed(Routes.HOME);
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
