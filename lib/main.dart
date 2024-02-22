import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:study_rest/binding/general_binding.dart';
import 'package:study_rest/binding/unique_binding.dart';
import 'package:study_rest/controllers/general_controller.dart';
import 'package:study_rest/controllers/unique_controller.dart';
import 'package:study_rest/pages/detail_page.dart';
import 'package:study_rest/pages/repos_page.dart';
import 'package:study_rest/rest/rest_client.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
            name: "/",
            page: () => const MyHomePage(title: 'Flutter Demo Home Page'),
            binding: GeneralBinding()),
        GetPage(
            name: '/repos',
            page: () => const ReposPage(),
            binding: UniqueBinding()),
        GetPage(
            name: '/detail',
            page: () => const DetailPage())// here!
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final logger = Logger();
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _controller,
            ),
            const SizedBox(height: 16,),
            ElevatedButton(
                onPressed: (){
                  Get.find<GeneralController>().getRepoGeneral(_controller.text);
                  Get.toNamed('/repos');
                },
                child: const Text("Buscar"))
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}