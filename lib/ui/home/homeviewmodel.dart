import 'package:stacked/stacked.dart';
import 'package:stackedbasic/app/utils.dart';
import 'package:stackedbasic/app/app.router.dart';

class Homeviewmodel extends BaseViewModel {
  void logout() {
    navigationService.pushNamedAndRemoveUntil(Routes.loginview);
  }

  void goToAddTask() {
    // This route will be available after running build_runner
    // navigationService.navigateTo(Routes.addTaskView);
  }
}
