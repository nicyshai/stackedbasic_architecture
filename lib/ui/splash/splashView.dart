import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedbasic/ui/splash/splashViewmodel.dart';


import '../../constants/assets.gen.dart';




class Splashview extends StatelessWidget {
  const Splashview({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashviewModel>.reactive(
      onViewModelReady: (viewModel) => viewModel.init(),
      viewModelBuilder: () => SplashviewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: Colors.orange.shade200,
          body: Center(
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              duration: const Duration(seconds: 2),
              curve: Curves.easeInBack,
              builder: (context, value, child) {
                return Transform.scale(
                  scale: value,
                  child: child,
                );
              },
              child: Assets.images.todo.image(
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}