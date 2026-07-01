
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedbasic/app/app.router.dart';
import 'package:stackedbasic/app/utils.dart';
import 'package:stackedbasic/ui/splash/splashViewmodel.dart';


import '../../constants/assets.gen.dart';
import 'dashboardviewModel.dart';





class Dashboardview extends StatelessWidget {
  const Dashboardview({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<Dashboardviewmodel>.reactive(
      onViewModelReady: (viewModel) => viewModel.init(),
      viewModelBuilder: () => Dashboardviewmodel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(title: Text("view"),),
          floatingActionButton: FloatingActionButton(onPressed: (){navigationService.navigateTo(Routes.addTaskView);},
          child: Icon(Icons.add),),

        );
      },
    );
  }
}
