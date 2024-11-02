import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HttpClient extends DioForNative {
  static final client = HttpClient._();
  
  HttpClient._();
  
  @override
  BaseOptions get options => BaseOptions(
    baseUrl: '${dotenv.env['API_URL']}/'
  );
}