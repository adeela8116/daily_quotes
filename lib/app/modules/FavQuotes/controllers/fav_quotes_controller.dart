import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/quotes.dart';

class FavQuotesController extends GetxController {
  //TODO: Implement FavQuotesController
  RxList<Quote> favQuotesList = <Quote>[].obs;
  RxInt currentPageIndex = 0.obs;


  @override
  Future<void> onInit() async {
    super.onInit();
    await getLikedQuotes();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getLikedQuotes() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> likedQuoteStrings = prefs.getStringList('likedQuotes') ?? [];

    List<Quote> quotes = likedQuoteStrings.map((item) {
      final parts = item.split('~');
      return Quote(content: parts[0], author: parts[1]);
    }).toList();
    favQuotesList.addAll(quotes);
    favQuotesList.refresh();
  }

}
