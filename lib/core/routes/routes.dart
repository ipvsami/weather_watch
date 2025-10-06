import 'package:get/get.dart';

import '../../features/search_page/view/search_page.dart';
import '../bindings/search_bar_controller_binding.dart';

List<GetPage> routes = [
  GetPage(
    name: SearchPage.route,
    page: () => SearchPage(),
    binding: SearchBarControllerBinding(),
  ),
];
