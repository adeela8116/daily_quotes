import 'package:get/get.dart';

import '../modules/FavQuotes/bindings/fav_quotes_binding.dart';
import '../modules/FavQuotes/views/fav_quotes_view.dart';
import '../modules/Quote/bindings/quote_binding.dart';
import '../modules/Quote/views/quote_view.dart';
import '../modules/Splash/bindings/splash_binding.dart';
import '../modules/Splash/views/splash_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.QUOTE,
      page: () => QuoteView(),
      binding: QuoteBinding(),
    ),
    GetPage(
      name: _Paths.FAV_QUOTES,
      page: () => const FavQuotesView(),
      binding: FavQuotesBinding(),
    ),
  ];
}
