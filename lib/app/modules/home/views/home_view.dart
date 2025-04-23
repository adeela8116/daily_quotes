import 'dart:math' as math;
import 'package:daily_quotes/utils/extentions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/ColorHelper.dart';
import '../../../../utils/helping_widgets/animated_container.dart';
import '../../../routes/app_pages.dart';
import '../../Quote/views/quote_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [ColorHelper.beige1, ColorHelper.lightViolet, ColorHelper.lightViolet, ColorHelper.beige1],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 0.2, 0.6, 1.0],
            ),
          ),
          child: Column(
            children: [
              60.spaceX,
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: const Text(
                        "Daily Dose of Inspiration",
                        style: TextStyle(
                          fontSize: 32,
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
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(Routes.FAV_QUOTES);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            color: ColorHelper.white.withOpacity(0.3),
                            border: Border.all(color: ColorHelper.lightPurple.withOpacity(0.35), width: 2.5),
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
                          child: Icon(Icons.favorite, color: ColorHelper.primaryPurple,)
                      ),
                    )
                  ],
                ),
              ),
              40.spaceX,
              Obx(
                  (){
                    if (controller.quotesList.isEmpty) {
                      return Center(child: CircularProgressIndicator()); // or any loading state
                    }
                    return Expanded(
                      child: ListWheelScrollView.useDelegate(
                        itemExtent: 210,
                        clipBehavior: Clip.antiAlias,
                        childDelegate: ListWheelChildLoopingListDelegate(
                            children: [
                              for(int i=0; i<controller.quotesList.length; i++)
                                singleQuoteContainer(
                                  controller.quotesList[i].content,
                                  controller.quotesList[i].author
                                )
                            ]
                        ),
                      ),
                    );
                  }
              )
            ],
          ),
        ),
    );
  }

  Widget singleQuoteContainer(String content, String author) {
    return GestureDetector(
      onTap: (){
        Get.to(() => QuoteView(), arguments: {
          'content': content,
          'author': author,
          'isFav' : false
        });
      },
      child: Stack(
        children: [
          Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: ColorHelper.primaryPurple,
                  borderRadius: BorderRadius.circular(20)
              ),
              constraints: BoxConstraints(
                minHeight: 100,
                maxHeight: 210,
              ),
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    content,
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  10.spaceX,
                  Text(
                    author,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
          ),

          Positioned(right: 5, top: 0,
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: ColorHelper.white,
                shape: BoxShape.circle,
              ),
              child: Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: ColorHelper.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: ColorHelper.primaryPurple, width: 3)
                ),
                child: Center(
                  child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: Icon(Icons.reply, color: ColorHelper.primaryPurple, size: 17)
                  ),
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}
