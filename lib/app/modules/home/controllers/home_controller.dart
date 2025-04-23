import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../models/quotes.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  RxList<Quote> quotesList = <Quote>[].obs;


  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchQuotes();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchQuotes() async {
    final response = await http.get(Uri.parse('https://zenquotes.io/api/quotes'));

    try{
      if (response.statusCode == 200) {
        final List quotesJson = json.decode(response.body);
        final List<Quote> quotes =
        quotesJson.map((json) => Quote.fromJson(json)).toList();
        quotesList.value = quotes;
        quotesList.refresh();
      } else {
        print('Error fetching quotes');
      }
    }catch (e){
      print('Error fetching quotes: $e');
      Get.snackbar("Error", "Failed to fetch quotes. Check internet connection.");
    }
  }
}
