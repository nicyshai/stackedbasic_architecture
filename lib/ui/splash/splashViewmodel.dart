
import 'package:stacked/stacked.dart';

import '../../app/app.router.dart';
import '../../app/utils.dart';

class SplashviewModel extends BaseViewModel {

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 4));
    final user = await userService.getUser();
    if (user != null ) {
      navigationService.pushNamedAndRemoveUntil(Routes.dashboardview);
    } else {
      navigationService.pushNamedAndRemoveUntil(Routes.onboardingView);
    }
  }

// void fetch() {
//   setBusy(true);
//
//   setBusy(false);
// }
}