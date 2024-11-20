import 'dart:async';
import 'package:shared/utils/request_dio.dart';

class HomeDataSource {
  Future<List> getDataList() async {
    try {
      final response = await requestDio.get(
        '/v1/images/search',
        queryParameters: {
          'limit': '10',
          'has_breeds': '1'
        }
      );

      return response.data;
    } catch(e) {
      rethrow;
    }
  }
}