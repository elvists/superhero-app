import 'package:dio/dio.dart';
import 'package:superhero/core/app_env.dart';

class DioInstance {
  static DioInstance _dioSingleton;
  Dio _http;

  factory DioInstance() {
    if (_dioSingleton == null) _dioSingleton = DioInstance._internal();
    return _dioSingleton;
  }

  DioInstance._internal() {
    _http = Dio()
      ..options.baseUrl = AppEnv.apiBaseUrl
      ..options.connectTimeout = 15000;
  }

  get client => _http;

  dispose() {
    _http.close();
  }
}
