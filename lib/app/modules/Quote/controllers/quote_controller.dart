import 'package:daily_quotes/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/quotes.dart';
import '../../FavQuotes/controllers/fav_quotes_controller.dart';

class QuoteController extends GetxController {
  //TODO: Implement QuoteController
  RxString selectedQuote = ''.obs;
  RxString selectedQuoteAuthor = ''.obs;
  late FavQuotesController favQuotesController;

  RxBool isFav = false.obs;
  RxBool isShared = false.obs;
  RxBool isCopied = false.obs;
  RxBool isFromFavQuoteView = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    print("onInit");
    if (Get.arguments != null) {
      print("onInit not null");
      selectedQuote.value = Get.arguments['content'] ?? '';
      selectedQuoteAuthor.value = Get.arguments['author'] ?? '';
      isFromFavQuoteView.value = Get.arguments['isFav'] ?? '';
      if(isFromFavQuoteView.value){
        favQuotesController = Get.put(FavQuotesController());
      }
      await checkIsFav('${selectedQuote.value}~${selectedQuoteAuthor.value}');
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    selectedQuote.value = '';
    selectedQuoteAuthor.value = '';
    print("closed");
  }


  void favQuote(String quote) {
    isFav.value = !(isFav.value);
    storeLikedQuote(quote);
  }

  void shareQuote(String quote) {
    isShared.value = !(isShared.value);
    Share.share(quote);
  }

  Future<void> checkIsFav(String quote) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> likedQuotes = prefs.getStringList('likedQuotes') ?? [];

    if (likedQuotes.contains(quote)) {
      isFav.value = true;
    }else{
      isFav.value = false;
    }
  }


  void copyQuote(String quote) {
    isCopied.value = true;
    Clipboard.setData(ClipboardData(text: quote));
    Get.snackbar( colorText: Colors.black, backgroundColor: Colors.white.withOpacity(0.8), 'Alert!', 'Quote copied to clipboard');
  }


  Future<void> storeLikedQuote(String quote) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> likedQuotes = prefs.getStringList('likedQuotes') ?? [];

    if (!likedQuotes.contains(quote)) {
      likedQuotes.add(quote);
      if(isFromFavQuoteView.value){
        final parts = quote.split('~');
        final realQuote = Quote(content: parts[0], author: parts[1]);
        favQuotesController.favQuotesList.add(realQuote);
        favQuotesController.favQuotesList.refresh();
      }
    }else{
      likedQuotes.remove(quote);
      if(isFromFavQuoteView.value){
        final parts = quote.split('~');
        final realQuote = Quote(content: parts[0], author: parts[1]);
        favQuotesController.favQuotesList.remove(realQuote);
        favQuotesController.favQuotesList.refresh();
      }
    }
    await prefs.setStringList('likedQuotes', likedQuotes);
  }
}
