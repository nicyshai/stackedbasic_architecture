 import 'package:stacked/stacked.dart';
import 'package:stackedbasic/app/utils.dart';

import '../../app/app.router.dart';

class SplashviewModel extends BaseViewModel {

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> init() async {
    await  Future.delayed(const Duration(seconds: 4));
    navigationService.pushNamedAndRemoveUntil(Routes.loginview);
  }

  void fetch() {
    setBusy(true);

    setBusy(false);
  }
}