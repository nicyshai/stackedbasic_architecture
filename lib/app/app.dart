import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stackedbasic/ui/home/homeview.dart';
import 'package:stackedbasic/ui/registration/registrationView.dart';

import '../services/apiService.dart';
import '../services/userservice.dart';
import '../ui/dashboard/dashboardview.dart';
import '../ui/login/loginView.dart';
import '../ui/splash/splashView.dart';

@StackedApp(
  routes:[
    MaterialRoute(page: Splashview, initial: true),
    MaterialRoute(page: Loginview),
    MaterialRoute(page: Homeview),
    MaterialRoute(page: Registrationview),
    MaterialRoute(page: Dashboardview),


  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: Apiservice),
    LazySingleton(classType: UserService),




  ],
)
class AppSetUp {}