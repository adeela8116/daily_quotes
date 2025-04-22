import 'package:daily_quotes/utils/extentions.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../utils/ColorHelper.dart';
import '../controllers/quote_controller.dart';

class QuoteView extends GetView<QuoteController> {
  const QuoteView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [ColorHelper.beige1, ColorHelper.lightViolet, ColorHelper.lightViolet, ColorHelper.beige1],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 0.4, 0.6, 1.0],
          ),
        ),
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            0.spaceX,
            Image.asset('assets/main/logo.png', width: 250),
            30.spaceX,
            Center(
              child: Text(
                '${controller.homeController.selectedQuote}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 3.0,
                      color: ColorHelper.lightPurple,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),

            120.spaceX,
            Text(
              '-  ${controller.homeController.selectedQuoteAuthor}  -',

              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    offset: Offset(2.0, 2.0),
                    blurRadius: 3.0,
                    color: ColorHelper.lightPurple,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
