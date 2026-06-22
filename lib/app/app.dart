import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/apiService.dart';
import '../ui/login/loginView.dart';
import '../ui/splash/splashView.dart';

@StackedApp(
  routes:[
    MaterialRoute(page: Splashview, initial: true),
    MaterialRoute(page: Loginview),

  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: Apiservice),


  ],
)
class AppSetUp {}