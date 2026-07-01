// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i9;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i11;
import 'package:stackedbasic/models/category.dart' as _i10;
import 'package:stackedbasic/ui/addtTask/addtaskView.dart' as _i8;
import 'package:stackedbasic/ui/dashboard/dashboardview.dart' as _i6;
import 'package:stackedbasic/ui/home/homeview.dart' as _i4;
import 'package:stackedbasic/ui/login/loginView.dart' as _i3;
import 'package:stackedbasic/ui/onboarding/onboardingview.dart' as _i7;
import 'package:stackedbasic/ui/registration/registrationView.dart' as _i5;
import 'package:stackedbasic/ui/splash/splashView.dart' as _i2;

class Routes {
  static const splashview = '/';

  static const loginview = '/Loginview';

  static const homeview = '/Homeview';

  static const registrationview = '/Registrationview';

  static const dashboardview = '/Dashboardview';

  static const onboardingView = '/onboarding-view';

  static const addTaskView = '/add-task-view';

  static const all = <String>{
    splashview,
    loginview,
    homeview,
    registrationview,
    dashboardview,
    onboardingView,
    addTaskView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(Routes.splashview, page: _i2.Splashview),
    _i1.RouteDef(Routes.loginview, page: _i3.Loginview),
    _i1.RouteDef(Routes.homeview, page: _i4.Homeview),
    _i1.RouteDef(Routes.registrationview, page: _i5.Registrationview),
    _i1.RouteDef(Routes.dashboardview, page: _i6.Dashboardview),
    _i1.RouteDef(Routes.onboardingView, page: _i7.OnboardingView),
    _i1.RouteDef(Routes.addTaskView, page: _i8.AddTaskView),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.Splashview: (data) {
      final args = data.getArgs<SplashviewArguments>(
        orElse: () => const SplashviewArguments(),
      );
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.Splashview(key: args.key),
        settings: data,
      );
    },
    _i3.Loginview: (data) {
      final args = data.getArgs<LoginviewArguments>(
        orElse: () => const LoginviewArguments(),
      );
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => _i3.Loginview(key: args.key),
        settings: data,
      );
    },
    _i4.Homeview: (data) {
      final args = data.getArgs<HomeviewArguments>(nullOk: false);
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.Homeview(key: args.key, id: args.id),
        settings: data,
      );
    },
    _i5.Registrationview: (data) {
      final args = data.getArgs<RegistrationviewArguments>(
        orElse: () => const RegistrationviewArguments(),
      );
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => _i5.Registrationview(key: args.key),
        settings: data,
      );
    },
    _i6.Dashboardview: (data) {
      final args = data.getArgs<DashboardviewArguments>(
        orElse: () => const DashboardviewArguments(),
      );
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => _i6.Dashboardview(key: args.key),
        settings: data,
      );
    },
    _i7.OnboardingView: (data) {
      final args = data.getArgs<OnboardingViewArguments>(
        orElse: () => const OnboardingViewArguments(),
      );
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => _i7.OnboardingView(key: args.key),
        settings: data,
      );
    },
    _i8.AddTaskView: (data) {
      final args = data.getArgs<AddTaskViewArguments>(
        orElse: () => const AddTaskViewArguments(),
      );
      return _i9.MaterialPageRoute<dynamic>(
        builder: (context) => _i8.AddTaskView(key: args.key, task: args.task),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class SplashviewArguments {
  const SplashviewArguments({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant SplashviewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class LoginviewArguments {
  const LoginviewArguments({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant LoginviewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class HomeviewArguments {
  const HomeviewArguments({this.key, required this.id});

  final _i9.Key? key;

  final num id;

  @override
  String toString() {
    return '{"key": "$key", "id": "$id"}';
  }

  @override
  bool operator ==(covariant HomeviewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.id == id;
  }

  @override
  int get hashCode {
    return key.hashCode ^ id.hashCode;
  }
}

class RegistrationviewArguments {
  const RegistrationviewArguments({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant RegistrationviewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class DashboardviewArguments {
  const DashboardviewArguments({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant DashboardviewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class OnboardingViewArguments {
  const OnboardingViewArguments({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant OnboardingViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class AddTaskViewArguments {
  const AddTaskViewArguments({this.key, this.task});

  final _i9.Key? key;

  final _i10.Task? task;

  @override
  String toString() {
    return '{"key": "$key", "task": "$task"}';
  }

  @override
  bool operator ==(covariant AddTaskViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.task == task;
  }

  @override
  int get hashCode {
    return key.hashCode ^ task.hashCode;
  }
}

extension NavigatorStateExtension on _i11.NavigationService {
  Future<dynamic> navigateToSplashview({
    _i9.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.splashview,
      arguments: SplashviewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToLoginview({
    _i9.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.loginview,
      arguments: LoginviewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToHomeview({
    _i9.Key? key,
    required num id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.homeview,
      arguments: HomeviewArguments(key: key, id: id),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToRegistrationview({
    _i9.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.registrationview,
      arguments: RegistrationviewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToDashboardview({
    _i9.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.dashboardview,
      arguments: DashboardviewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToOnboardingView({
    _i9.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.onboardingView,
      arguments: OnboardingViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToAddTaskView({
    _i9.Key? key,
    _i10.Task? task,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.addTaskView,
      arguments: AddTaskViewArguments(key: key, task: task),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithSplashview({
    _i9.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.splashview,
      arguments: SplashviewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithLoginview({
    _i9.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.loginview,
      arguments: LoginviewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithHomeview({
    _i9.Key? key,
    required num id,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.homeview,
      arguments: HomeviewArguments(key: key, id: id),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithRegistrationview({
    _i9.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.registrationview,
      arguments: RegistrationviewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithDashboardview({
    _i9.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.dashboardview,
      arguments: DashboardviewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithOnboardingView({
    _i9.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.onboardingView,
      arguments: OnboardingViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithAddTaskView({
    _i9.Key? key,
    _i10.Task? task,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.addTaskView,
      arguments: AddTaskViewArguments(key: key, task: task),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }
}
