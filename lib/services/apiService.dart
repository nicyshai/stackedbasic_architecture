 import 'package:dio/dio.dart';

import 'package:logger/logger.dart';

import '../models/User.dart';

class Apiservice
 {

late Dio _dio;
final logger = Logger();

 Apiservice() {
  _dio = Dio(
    BaseOptions(
      baseUrl: "https://freeapi.luminartechnohub.com",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
    ),
  );

  _dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      logger.i("url:${options.path}");
      logger.i("method:${options.method}");
      logger.i("baseurl:${options.baseUrl}");
      logger.i("headers:${options.headers}");
      logger.i("data:${options.data}");
      handler.next(options);
    },
    onResponse: (response, handler) {
      logger.i("statusCode:${response.statusCode}");
      logger.i("resp:${response.data}");
      handler.next(response);
    },
    onError: (error, handler) {
      logger.e("err:${error.message}");
      logger.e("stack trace:${error.stackTrace}");
      handler.next(error);
    },
  ));
}
Future<User?> login({required String email, required String password}) async {
   try{
     final response=await _dio.post("/login",data: {
       "email":email,
       "password":password,
     });
     if(response.statusCode==200){
       return User.fromJson(response.data);
     }
   }on DioException catch(e){
     logger.e(e.message);
   }

    }
}


