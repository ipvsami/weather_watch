import 'package:get/get.dart';

import '../../features/search_page/controller/search_bar_controller.dart';

class SearchBarControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchBarController());
  }
}
