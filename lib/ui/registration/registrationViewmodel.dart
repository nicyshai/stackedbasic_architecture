 import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedbasic/app/utils.dart';

import '../../app/app.router.dart';

class Registrationviewmodel extends BaseViewModel {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  final formKey = GlobalKey<FormState>();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void init() {

  }
  Future<void> registration() async {
    if(  formKey.currentState!.validate()) {
      setBusy(true);
      try{
        var user=await apiservice.registration(
            name: nameController.text.trim(),
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
            place: placeController.text.trim(),
            phone: phoneController.text.trim(),
            pincode: pincodeController.text.trim());
        if(user!=null){
          SmartDialog.showToast(
            "Registration successful", displayTime: const Duration(seconds: 2),);
          await userService.saveUser(user);
          navigationService.replaceWith(Routes.loginview);

        }
        else{
          SmartDialog.showToast("Registration Failed...");

        }
      }
 catch (e) {
    SmartDialog.showToast(" an Unexpected Errorr..");
    print(e);
    setBusy(false);
    setError(e.toString());
    }
    finally {
    setBusy(false);
    }

  }

}
 }