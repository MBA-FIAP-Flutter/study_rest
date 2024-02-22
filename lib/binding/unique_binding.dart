import 'package:get/get.dart';
import 'package:study_rest/controllers/unique_controller.dart';

class UniqueBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(UniqueController());
  }
}