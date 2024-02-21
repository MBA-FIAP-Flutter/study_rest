import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:study_rest/controllers/general_controller.dart';
import 'package:study_rest/controllers/unique_controller.dart';

class ReposPage extends GetView<GeneralController> {

  const ReposPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Repositories"),
      ),
      body: controller.obx(
            (state) =>
            ListView.separated(
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Get.find<UniqueController>().getRepoUnique(Get.find<GeneralController>().lastUser ?? "", state?[index].name ?? "");
                  Navigator.pushNamed(context, '/detail');
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(state?[index].name ?? "-"),
                ),
              ),
              separatorBuilder: (context, index) => Divider(height: 1,),
              itemCount: state?.length ?? 0,
            ),
        onLoading: const CircularProgressIndicator(),
        onEmpty: const Text('No data found'),
        onError: (error) => Text(error ?? "Error"),
      ),
    );
  }
}