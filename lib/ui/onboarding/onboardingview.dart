import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedbasic/ui/dashboard/dashboardviewmodel.dart'
    hide DashboardViewModel;

import 'onboardingviewmodel.dart';

class OnboardingView extends StatelessWidget {
  OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingViewModel>.reactive(
      onViewModelReady: (viewModel) => viewModel.init(),
      viewModelBuilder: () => OnboardingViewModel(),
      builder: (context, viewModel, child) {
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.purple.shade100
                  ]
              )

          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(actions: [
              TextButton(onPressed: viewModel.skip, child: Text("Skip >>",style: TextStyle(color: Colors.purple),))
            ],),
            body: SizedBox.expand(
              child: Stack(
                children: [
                  Positioned(
                    top: 100,
                    left: 24,
                    right: 24,
                    child: Container(
                      height: 300,
                      width: MediaQuery.widthOf(context),
                      child: PageView.builder(
                        onPageChanged: viewModel.onPageChanged,
                        controller: viewModel.pageController,
                        itemCount: viewModel.pages.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: .center,
                              children: [
                                Card(
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FaIcon(
                                      viewModel.pages[index].icon,
                                      size: 40,
                                      color: viewModel.pages[index].color,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 36,),
                                Text(
                                  viewModel.pages[index].title,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 16,),
                                Text(
                                  viewModel.pages[index].description,
                                  textAlign: .center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,

                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 24,
                    left: 24,
                    right: 24,
                    child: SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        onPressed: viewModel.nextPage,
                        child: Text(viewModel.current_index==viewModel.pages.length-1?"Get Started":"Next"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 12,horizontal: 24),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}