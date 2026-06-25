 import 'package:dio/dio.dart';

import 'package:logger/logger.dart';
import 'package:stackedbasic/models/RespProducts.dart';

import '../app/utils.dart';
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
    Future<User?> registration({required String name,required String email,required String password,required String place,required phone,required pincode}) async {
   try{
     //
     // "name": "string",
     //  "phone": 9223372036854776000,
     //  "place": "string",
     //  "pincode": 2147483647,
     //  "email": "user@example.com",
     //  "password": "string"
     final response=await _dio.post("/registration",data: {
       "name":name,
       "phone":phone,
       "pincode":pincode,
       "email":email,
       "password":password,
       "place":place,
     });
     if(response.statusCode==200){
       return User.fromJson(response.data);


     }
   }
   on DioException catch(e){
     logger.e(e.message);
   }

    }
    Future<List<Products>?> getproductsall() async {
    try{
     final response=await _dio.get("/products-all/",
         options: Options(
           headers: {"Authorization":"Bearer ${await userService.getAccessKey()}"},

         )  );
     if(response.statusCode==200){
       var allproducts=RespProducts.fromJson(response.data);
       return allproducts.data;

     }
     var allproducts=RespProducts.fromJson(response.data);
     return allproducts.data;
    }
    on DioException catch(e){
      logger.e("DioException:${e.message}");
    }
    catch(e){
      logger.e("Error:${e}");
    }
    }
}


