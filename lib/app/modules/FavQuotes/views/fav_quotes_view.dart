// import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:daily_quotes/utils/extentions.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../utils/ColorHelper.dart';
import '../../../routes/app_pages.dart';
import '../../Quote/views/quote_view.dart';
import '../controllers/fav_quotes_controller.dart';

class FavQuotesView extends GetView<FavQuotesController> {
  const FavQuotesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [ColorHelper.beige1, ColorHelper.lightViolet, ColorHelper.lightViolet, ColorHelper.beige1],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 0.2, 0.6, 1.0],
          ),
        ),
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            80.spaceX,
            Text(
              "Favourite\nQuotes",
              style: TextStyle(
                fontSize: 32,
                height: 1.1,
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
            100.spaceX,
            Obx(
                (){
                  if (controller.favQuotesList.isEmpty) {
                    return Center(child: CircularProgressIndicator()); // or any loading state
                  }
                  return Center(
                      child: CarouselSlider(
                          items: controller.favQuotesList.map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return singleQuoteContainer(
                                  '${i.content}', '${i.author}'
                                );
                              },
                            );
                          }).toList(),

                          options: CarouselOptions(
                            height: 400,
                            aspectRatio: 16/9,
                            viewportFraction: 0.8,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration: Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.3,
                            onPageChanged: (index, reason) {
                              controller.currentPageIndex.value = index;
                            },
                            scrollDirection: Axis.horizontal,
                          )
                      )
                  );
                }
            ),
            30.spaceX,
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(controller.favQuotesList.length, (index) {
                return Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: controller.currentPageIndex.value == index ? 1:0, color: controller.currentPageIndex.value == index ? ColorHelper.primaryPurple : ColorHelper.beige1),
                    color: controller.currentPageIndex.value == index
                        ? ColorHelper.primaryPurple
                        : ColorHelper.beige1,
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    width: controller.currentPageIndex.value == index? 14:12,
                    height: controller.currentPageIndex.value == index? 14:12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: ColorHelper.beige1),
                      color: controller.currentPageIndex.value == index
                          ? ColorHelper.primaryPurple
                          : ColorHelper.beige1,
                    ),
                    padding: EdgeInsets.all(2),
                  ),
                );
              }),
            )),
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
          'isFav' : true
        });
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: ColorHelper.primaryPurple,
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
