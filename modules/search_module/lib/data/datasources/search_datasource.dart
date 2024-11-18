import 'dart:async';
import 'package:dio/dio.dart';

class SearchDataSource {
  Future<List> getSearchResults(String query) async {
    try {
      final dio = Dio();
      Response response;

      response = await dio.get(
        'https://api.thecatapi.com/v1/breeds/search?q=$query&api_key=live_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr'
      );

      return response.data;
    } catch(e) {
      rethrow;
    }
  }
}