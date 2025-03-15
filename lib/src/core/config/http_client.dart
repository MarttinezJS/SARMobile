import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HttpClient extends DioForNative {

  late BaseOptions customOptions;
  static final api = HttpClient._(BaseOptions(
    baseUrl: '${dotenv.env['API_URL']}/'
  ));
  static final azura = HttpClient._(BaseOptions(
    baseUrl: '${dotenv.env['AZURA_API_URL']}/',
    headers: {
      "X-API-Key": dotenv.env['AZURA_API_KEY']
    }
  ));

  HttpClient._(BaseOptions options){
    customOptions = options;
  }
  
  @override
  BaseOptions get options => customOptions;
}