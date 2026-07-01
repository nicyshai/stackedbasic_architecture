import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedbasic/app/app.router.dart';
import 'package:stackedbasic/app/utils.dart';

class OnboardingViewModel extends BaseViewModel {
  final List<OnBoardingadata> pages = [
    OnBoardingadata(
      title: "Organize Your Tasks",
      description:
      "Create and manage your daily tasks in one place.",
      icon: FontAwesomeIcons.list,
      color: Colors.blue,
    ),
    OnBoardingadata(
      title: "Stay Productive",
      description:
      "Set priorities and never miss an important task.",
      icon: FontAwesomeIcons.arrowRightToCity,
      color: Colors.green,
    ),
    OnBoardingadata(
      title: "Track Your Progress",
      description:
      "Mark tasks as completed and monitor your productivity every day.",
      icon: FontAwesomeIcons.barsProgress,
      color: Colors.orange,
    ),
  ];

  int current_index=0;
  final PageController pageController = PageController();
  void onPageChanged(int index) {
    current_index = index;
    notifyListeners();
  }
  void nextPage() {
    if(current_index==pages.length-1){
      navigationService.pushNamedAndRemoveUntil(Routes.loginview);
    }else{
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void skip(){
    navigationService.pushNamedAndRemoveUntil(Routes.loginview);
  }

  void previousPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void init() {

  }


}
class OnBoardingadata{
  String title;
  String description;
  FaIconData icon;
  Color color;
  OnBoardingadata({required this.title, required this.description, required this.icon, required this.color});

}