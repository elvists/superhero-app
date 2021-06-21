import 'package:dio/dio.dart';
import 'package:superhero/api/dio_singleton.dart';
import 'package:superhero/model/superhero.dart';

class SuperheroWebClient {
  final Dio _dio = DioInstance().client;

  Future<dynamic> getAll() async {
    final response = await _dio.get('all.json');
    return response.data;
  }

  Future<dynamic> getById(int id) async {
    final response = await _dio.get('id/$id.json');
    return response.data;
  }
}
