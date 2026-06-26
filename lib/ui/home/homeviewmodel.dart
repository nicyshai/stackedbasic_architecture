import 'package:dio/dio.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stackedbasic/app/utils.dart';
import 'package:stackedbasic/models/RespProducts.dart';

import '../../services/userservice.dart';
import '../../../app/app.router.dart';

class Homeviewmodel extends BaseViewModel {
 List<Products>? plist=[];
 late num id;

 Homeviewmodel(this.id);

  void init(){
  fetchproducts();

 }
 Future<void> fetchproducts() async {
  setBusy(true);
  try{
   plist=await apiservice.getproductsall();
   if(plist==null){
    setError("No Data Found");
   }
   setBusy(false);
  }
  on DioException catch(e){
   setBusy(false);
   setError(e.message);
  }
  catch(e){
   setBusy(false);
   setError(e);
  }
 }
}