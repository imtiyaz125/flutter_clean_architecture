import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';

class NetworkUtil {
  // next three lines makes this class a Singleton


  Dio _dio;

  NetworkUtil() {
    Options options = Options(receiveTimeout: 5000, connectTimeout: 5000);
    _dio = Dio(options);
  //  _setupLoggingInterceptor();
  }



  Future<Response> getReq(String url) async {
    try {
      Response response = await _dio.get(url);
      return response;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return error;
    }
  }


  /*Future<dynamic> postReq(ApiResponse resp,String url, {Map body,header}) {
    return http.post(url, body: json.encode(body), headers: header)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      print("Request header");
      print(response.request.headers);
      print("==========================");
      print("Request Body");
      print(body);
      print("==========================");
      print("Response");
      print(statusCode);
      print(res);
      if (statusCode < 200 || statusCode > 400 || json == null) {
        // resp.onFailure("Error while fetching data");
        try {
          throw new Exception("Error while fetching data");
        }catch(e){
          print(e.toString());
        }
      }
      //  resp.onSuccess(_decoder.convert(res));
      print(_decoder.convert(res));
      return _decoder.convert(res);
    });
  }*/

}

