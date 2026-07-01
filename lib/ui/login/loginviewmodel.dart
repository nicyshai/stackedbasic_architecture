import 'package:flutter/cupertino.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:stacked/stacked.dart';

import '../../app/app.router.dart';
import '../../app/utils.dart';
import '../home/homeview.dart';

class Loginviewmodel extends BaseViewModel {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void init() {

  }
  Future<void> login() async {
    if(
    formKey.currentState!.validate()) {
      setBusy(true);
      try {
        var user = await apiservice.login(email: emailController.text.trim(),
            password: passwordController.text.trim());
        if (user != null) {
          SmartDialog.showToast(
              "Login successful", displayTime: const Duration(seconds: 2),);
          await userService.saveUser(user);
          navigationService.replaceWith(Routes.dashboardview);
        }
        else{
          SmartDialog.showToast("Login Failed...");
        }
      } catch (e) {
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