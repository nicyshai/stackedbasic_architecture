import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../services/userservice.dart';
import '../../../app/app.router.dart';

class Homeviewmodel extends BaseViewModel {
  final UserService _userService = UserService();

  final NavigationService _navigationService = NavigationService();

  Future<void> logout() async {
    setBusy(true);
    try {
      await _userService.logout();
      await _navigationService.replaceWith(Routes.loginview);
    } catch (e) {
      SmartDialog.showToast('logout failed');
      setError(e.toString());
    } finally {
      setBusy(false);
    }
  }
}