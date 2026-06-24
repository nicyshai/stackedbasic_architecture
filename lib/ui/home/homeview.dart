import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';


import 'homeviewmodel.dart';


class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<Homeviewmodel>.reactive(
      viewModelBuilder: () => Homeviewmodel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Home View"),
          ),

        );
      },
    );
  }
}