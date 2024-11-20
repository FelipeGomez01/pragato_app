import 'dart:async';
import 'package:shared/utils/request_dio.dart';

class SearchDataSource {
  Future<List> getSearchResults(String query) async {
    try {
      final response = await requestDio.get(
          '/v1/breeds/search',
          queryParameters: {
            'q': query
          }
      );

      return response.data;
    } catch(e) {
      rethrow;
    }
  }
}