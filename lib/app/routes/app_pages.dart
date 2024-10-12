import 'package:get/get.dart';
import '../modules/http_screen/bindings/http_binding.dart';
import '../modules/http_screen/views/http_view.dart';
import '../modules/webview_screen/views/webview_view.dart';
import '../modules/http_screen/views/article_details_view.dart';
import '../modules/home/views/home_view.dart'; // Import HomeView

part 'app_routes.dart';
class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME; // Ubah ke Routes.HOME
  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(), // Halaman awal
    ),
    GetPage(
      name: Routes.HTTP,
      page: () => const HttpView(),
      binding: HttpBinding(),
    ),
    GetPage(
      name: Routes.WEBVIEW,
      page: () => const WebViewView(),
    ),
    GetPage(
      name: Routes.ARTICLE_DETAILS,
      page: () => ArticleDetailsView(),
    ),
  ];
}
