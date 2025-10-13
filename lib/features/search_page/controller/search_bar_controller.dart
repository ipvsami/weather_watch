import 'package:get/get.dart';

import '../../../core/services/coordinates_api.dart';
import '../../../data/models/coordinates_model.dart';

class SearchBarController extends GetxController {
  RxString searchQuery = ''.obs;
  RxList<CoordinatesModel> coordinates = <CoordinatesModel>[].obs;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    debounce(
      searchQuery,
      (callback) async {
        if (searchQuery.value.isEmpty) {
          isLoading.value = false;
          coordinates.clear();
          return;
        }
        isLoading.value = true;
        try {
          List<CoordinatesModel> result = await fetchCoordinates();
          coordinates.assignAll(result);
        } catch (e) {
          rethrow;
        } finally {
          isLoading.value = false;
        }
      },
      time: Duration(milliseconds: 300),
    );
  }

  Future<List<CoordinatesModel>> fetchCoordinates() async {
    return await CoordinatesApi.fetchCoordinates(searchQuery.value);
  }

  void changeSearchQuery(String value) {
    searchQuery.value = value;
  }
}
