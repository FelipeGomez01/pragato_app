import 'dart:async';
import 'package:dio/dio.dart';

class HomeDataSource {
  Future<List> getDataList() async {
    try {
      final dio = Dio();
      Response response;

      response = await dio.get(
        'https://api.thecatapi.com/v1/images/search?limit=10&has_breeds=1&api_key=live_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr'
      );

      return response.data;
    } catch(e) {
      rethrow;
    }
  }
}