import 'base_url.dart';
import 'package:dio/dio.dart';

class DioHttp {
  static Map<String, dynamic> headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  static Dio request = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: headers,
    ),
  );
}
