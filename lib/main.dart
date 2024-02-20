import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:study_rest/rest/rest_client.dart';
import 'package:logger/logger.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
                final dio = Dio();
                dio.interceptors.add(
                  InterceptorsWrapper(
                    onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
                      // Do something before request is sent.
                      // If you want to resolve the request with custom data,
                      // you can resolve a `Response` using `handler.resolve(response)`.
                      // If you want to reject the request with a error message,
                      // you can reject with a `DioException` using `handler.reject(dioError)`.
                      return handler.next(options);
                    },
                    onResponse: (Response response, ResponseInterceptorHandler handler) {
                      // Do something with response data.
                      // If you want to reject the request with a error message,
                      // you can reject a `DioException` object using `handler.reject(dioError)`.
                      return handler.next(response);
                    },
                    onError: (DioException error, ErrorInterceptorHandler handler) {
                      // Do something with response error.
                      // If you want to resolve the request with some custom data,
                      // you can resolve a `Response` object using `handler.resolve(response)`.
                      return handler.next(error);
                    },
                  ),
                );
                final client = RestClient(dio);

                client.getRepoGeneral(_controller.text).then((it) => logger.i(it));
              },
              child: const Text("Buscar"))
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
