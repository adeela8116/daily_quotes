import 'package:daily_quotes/utils/extentions.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../utils/ColorHelper.dart';
import '../../../../utils/helping_widgets/animated_container.dart';
import '../../../routes/app_pages.dart';
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
                child: const Text(
                  "Daily Dose of Inspiration",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
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
        controller.selectedQuote.value = content;
        controller.selectedQuoteAuthor.value = author;
        Get.toNamed(Routes.QUOTE);
      },
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: ColorHelper.bGLight1,
              borderRadius: BorderRadius.circular(20)
          ),
          constraints: BoxConstraints(
            minHeight: 100,
            maxHeight: 210,
          ),
          margin: EdgeInsets.symmetric(horizontal: 8),
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
    );
  }
}
