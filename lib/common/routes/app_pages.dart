import 'package:get/get.dart';
import 'package:stock_track/pages/home/home_page.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.Home;

  static final routes = [
    GetPage(
      name: AppRoutes.Home,
      page: () => HomeView(),
    ),
  ];
}
