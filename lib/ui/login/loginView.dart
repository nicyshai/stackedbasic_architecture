import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedbasic/ui/login/loginviewmodel.dart';
import 'package:stackedbasic/ui/tools/blur_background.dart';

import '../../app/app.router.dart';
import '../../app/utils.dart';
import '../../constants/assets.gen.dart';

class Loginview extends StatelessWidget {
  const Loginview({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<Loginviewmodel>.reactive(
      onViewModelReady: (viewModel) => viewModel.init(),
      viewModelBuilder: () => Loginviewmodel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: Colors.orangeAccent,
          body: SizedBox.expand(
            child: Stack(

              children: [
                Center(
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      width: MediaQuery.widthOf(context),
                      height: 450,
                      padding: EdgeInsets.all(8),
                      child: Form(
                        key: viewModel.formKey,
                        child: Column(
                          mainAxisAlignment: .center,
                          crossAxisAlignment: .center,
                          children: [
                             Assets.images.todo.image(
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            TextFormField(
                              validator: (v) {
                                return v!.isEmpty ? "must fill" : null;
                              },

                              controller: viewModel.emailController,
                              decoration: InputDecoration(
                                hintText: "Email",
                                prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 16),

                            TextFormField(
                              validator: (v) {
                                return v!.isEmpty ? "must fill" : null;
                              },

                              controller: viewModel.passwordController,
                              decoration: InputDecoration(
                                hintText: "Password",
                                prefixIcon: Icon(Icons.lock),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 16),
                            SizedBox(
                              width:MediaQuery.widthOf(context),
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  viewModel.login() ;
                                },
                                child: Text("Login"),
                              ),
                            ),
                            TextButton(onPressed: (){
                              navigationService.navigateToRegistrationview();
                            }, child: Text("register"))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                viewModel.isBusy?Positioned.fill(child: BlurBackground(child: Center(child: Text("please wait....")), blur: .9)):SizedBox()
              ],
            ),
          ),
        );
      },
    );
  }
}
