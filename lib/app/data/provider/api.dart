import 'package:dio/dio.dart';
import 'package:dream/app/data/provider/api_interface.dart';

class DreamInterceptor extends Interceptor {
  final Dio _dioInstance;
  DreamInterceptor(this._dioInstance);

  //onRequest
  //onError
}

class DreamApiProvider implements DreamApiInterface {
  final Dio dio = Dio();
  final baseUrl = "https:...";

  DreamApiProvider() {
    dio.options.baseUrl = baseUrl;
    dio.interceptors.add(DreamInterceptor(dio));
  }

  @override
  Future<void> getInfo() async {
    String url = "/test";
    dio.post(url);
  }
}
