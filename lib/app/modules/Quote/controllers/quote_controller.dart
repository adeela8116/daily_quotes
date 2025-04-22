import 'package:daily_quotes/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuoteController extends GetxController {
  //TODO: Implement QuoteController
  RxString selectedQuote = ''.obs;
  RxString selectedQuoteAuthor = ''.obs;

  RxBool isFav = false.obs;
  RxBool isShared = false.obs;
  RxBool isCopied = false.obs;

  @override
  void onInit() {
    super.onInit();
    print("onInit");
    if (Get.arguments != null) {
      print("onInit not null");
      selectedQuote.value = Get.arguments['content'] ?? '';
      selectedQuoteAuthor.value = Get.arguments['author'] ?? '';
      isFav.value = Get.arguments['isFav'] ?? '';
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
    }else{
      likedQuotes.remove(quote);
    }
    await prefs.setStringList('likedQuotes', likedQuotes);
  }
}
