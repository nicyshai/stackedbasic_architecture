import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stackedbasic/ui/home/homeview.dart';
import 'package:stackedbasic/ui/registration/registrationView.dart';

import '../services/apiService.dart';
import '../services/databaseservice.dart';
import '../services/userservice.dart';
import '../ui/addtTask/addtaskView.dart';
import '../ui/dashboard/dashboardview.dart';
import '../ui/login/loginView.dart';
import '../ui/onboarding/onboardingview.dart';
import '../ui/splash/splashView.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: Splashview, initial: true),
    MaterialRoute(page: Loginview),
    MaterialRoute(page: Homeview),
    MaterialRoute(page: Registrationview),
    MaterialRoute(page: Dashboardview),
    MaterialRoute(page: OnboardingView),
    MaterialRoute(page: AddTaskView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: Apiservice),
    LazySingleton(classType: UserService),
    LazySingleton(classType: Databaseservice),
  ],
)
class AppSetUp {}
