import 'package:dio/dio.dart';
import 'package:shared/config/config.dart';

class RequestDio {
  static get init {
    _addInterceptor();

    return _dio;
  }

  static final _dio = Dio();

  static _addInterceptor() {
    _dio.options.baseUrl = Config.apiUrl;
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
          options.headers['x-api-key'] = Config.apiKey;

          return handler.next(options);
        }
      )
    );
  }
}

final requestDio = RequestDio.init;