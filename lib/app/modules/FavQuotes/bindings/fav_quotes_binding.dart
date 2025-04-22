import 'package:get/get.dart';

import '../controllers/fav_quotes_controller.dart';

class FavQuotesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavQuotesController>(
      () => FavQuotesController(),
    );
  }
}
