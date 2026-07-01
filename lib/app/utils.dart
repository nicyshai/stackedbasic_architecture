import 'package:stacked_services/stacked_services.dart';
import 'package:stackedbasic/services/apiService.dart';
import 'package:stackedbasic/services/databaseservice.dart';

import '../services/userservice.dart';
import 'app.locator.dart';

NavigationService get navigationService => locator<NavigationService>();
Apiservice get apiservice => locator<Apiservice>();
UserService get userService => locator<UserService>();
Databaseservice get databaseservice => locator<Databaseservice>();