import 'package:daily_quotes/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class QuoteController extends GetxController {
  //TODO: Implement QuoteController
  HomeController homeController = Get.put(HomeController());
  RxBool isFav = false.obs;
  RxBool isShared = false.obs;
  RxBool isCopied = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void favQuote() {
    isFav.value = !(isFav.value);
  }

  void shareQuote(String quote) {
    isShared.value = !(isShared.value);
    Share.share(quote);
  }


  void copyQuote() {
    isCopied.value = !(isCopied.value);
  }

}
