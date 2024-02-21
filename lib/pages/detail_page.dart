import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:study_rest/controllers/unique_controller.dart';

class DetailPage extends GetView<UniqueController> {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data of Repository"),
      ),
      body: controller.obx(
            (state) =>
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Forks count: ${state?.forksCount ?? 0}"),
                  Text("Open issue count: ${state?.openIssuesCount ?? 0}"),
                  Text("Watchers count: ${state?.watchersCount ?? 0}"),
                  Text("Subscribers count: ${state?.subscribersCount ?? 0}"),
                ],
              ),
            ),
        onLoading: const CircularProgressIndicator(),
        onEmpty: const Text('No data found'),
        onError: (error) => Text(error ?? "Error"),
      ),
    );
  }
}