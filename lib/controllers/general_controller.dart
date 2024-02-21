import 'package:get/get.dart';
import 'package:study_rest/model/repo_general.dart';
import 'package:study_rest/rest/rest_client.dart';

class GeneralController extends GetxController with StateMixin <List<RepoGeneral>> {
  final RestClient _apiProvider = Get.find<RestClient>();

  String? lastUser;

  void getRepoGeneral(String user) {
    lastUser = user;
    change(null, status: RxStatus.loading());
    _apiProvider.getRepoGeneral(user).then((response) {
      change(response, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}