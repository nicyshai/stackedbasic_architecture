import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedbasic/ui/splash/splashViewmodel.dart';


import '../../constants/assets.gen.dart';
import 'onboardingviewmodel.dart';




class Onboardingview extends StatelessWidget {
  const Onboardingview({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<Onboardingviewmodel>.reactive(
      onViewModelReady: (viewModel) => viewModel.init(),
      viewModelBuilder: () => Onboardingviewmodel(),
      builder: (context, viewModel, child) {
        return Scaffold(

        );
      },
    );
  }
}