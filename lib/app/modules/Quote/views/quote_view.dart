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
                           onTap:controller.favQuote,
                             child: Container(
                                 decoration: BoxDecoration(
                                   color: ColorHelper.white.withOpacity(0.6),
                                   border: Border.all(color: ColorHelper.lightPurple, width: 2.5),
                                   borderRadius: BorderRadius.circular(10),
                                   boxShadow: [
                                     BoxShadow(
                                       color: ColorHelper.lightViolet.withOpacity(0.9),
                                       spreadRadius: 3,
                                       blurRadius: 10,
                                       offset: Offset(0, 5), // changes position of shadow
                                     ),
                                   ],
                                 ),
                                 padding: EdgeInsets.all(5),
                                 child: Icon(controller.isFav.value?Icons.favorite:Icons.favorite_border, color: ColorHelper.primaryYellow,)
                             )
                         ),

                        GestureDetector(
                            onTap:(){
                              controller.shareQuote('"${controller.homeController.selectedQuote}" \n ~~${controller.homeController.selectedQuoteAuthor}');
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  color: ColorHelper.white.withOpacity(0.6),
                                  border: Border.all(color: ColorHelper.lightPurple, width: 2.5),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: ColorHelper.lightViolet.withOpacity(0.9),
                                      spreadRadius: 3,
                                      blurRadius: 10,
                                      offset: Offset(0, 5), // changes position of shadow
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.all(5),
                                child: Icon(controller.isShared.value?CupertinoIcons.share:CupertinoIcons.share_solid, color: ColorHelper.primaryYellow,)
                            )
                        ),

                        GestureDetector(
                            onTap:controller.copyQuote,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: ColorHelper.white.withOpacity(0.6),
                                    border: Border.all(color: ColorHelper.lightPurple, width: 2.5),
                                    borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: ColorHelper.lightViolet.withOpacity(0.9),
                                      spreadRadius: 3,
                                      blurRadius: 10,
                                      offset: Offset(0, 5), // changes position of shadow
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.all(5),
                                child: Icon(controller.isCopied.value?Icons.copy:Icons.file_copy, color: ColorHelper.primaryYellow,)
                            )
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
}
