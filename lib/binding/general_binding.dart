import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:study_rest/controllers/general_controller.dart';
import 'package:study_rest/rest/rest_client.dart';

class GeneralBinding implements Bindings {
  @override
  void dependencies() {
    final dio = Dio();
    RestClient client = RestClient(dio);
    Get.put(client);

    Get.put(GeneralController());
  }
}