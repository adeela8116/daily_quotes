import 'package:daily_quotes/utils/extentions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

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

            200.spaceX,
            Obx(
                (){
                  return Container(
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        20.spaceY,
                         GestureDetector(
                           onTap:(){
                             controller.favQuote('${controller.homeController.selectedQuote}~${controller.homeController.selectedQuoteAuthor}');
                           },
                             child: bottomButtons(
                                 Icon(controller.isFav.value?Icons.favorite:Icons.favorite_border, color: ColorHelper.primaryYellow,)
                             )
                         ),

                        GestureDetector(
                            onTap:(){
                              controller.shareQuote('"${controller.homeController.selectedQuote}" \n ~~${controller.homeController.selectedQuoteAuthor}');
                            },
                            child: bottomButtons(
                                Icon(controller.isShared.value?CupertinoIcons.share_solid:CupertinoIcons.share, color: ColorHelper.primaryYellow,)
                            )
                        ),

                        GestureDetector(
                            onTap:(){
                              controller.copyQuote('"${controller.homeController.selectedQuote}" \n ~~${controller.homeController.selectedQuoteAuthor}');
                            },
                            child: bottomButtons(Icon(controller.isCopied.value?Icons.file_copy:Icons.copy, color: ColorHelper.primaryYellow,))
                        ),

                        20.spaceY,
                      ],
                    ),
                  );
                }
            )
          ],
        ),
      ),
    );
  }

  Container bottomButtons(Widget icon) {
    return Container(
         decoration: BoxDecoration(
           color: ColorHelper.white.withOpacity(0.6),
           border: Border.all(color: ColorHelper.lightPurple, width: 2.5),
           borderRadius: BorderRadius.circular(10),
           boxShadow: [
             BoxShadow(
               color: ColorHelper.lightViolet.withOpacity(0.9),
               spreadRadius: 3,
               blurRadius: 10,
               offset: Offset(2, 2),
             ),
           ],
         ),
         padding: EdgeInsets.all(5),
         child: icon
     );
  }
}
