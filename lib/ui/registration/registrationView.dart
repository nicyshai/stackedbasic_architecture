import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedbasic/ui/registration/registrationViewmodel.dart';

class Registrationview extends StatelessWidget {
  const Registrationview({super.key});

  @override
  Widget build(BuildContext context,) {
    return ViewModelBuilder<Registrationviewmodel>.reactive(
      onViewModelReady: (viewModel) => viewModel.init(),
      viewModelBuilder: () => Registrationviewmodel(),
      builder: (context, viewmodel, child) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.widthOf(context),
          height: 500,
          decoration: BoxDecoration(
            color: Colors.orange.shade100,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: viewmodel.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  TextFormField(
                    validator: (v){
                      return v!.isEmpty?"must fill":null;
                    },
                    controller: viewmodel.nameController,
                    decoration: InputDecoration(
                      hintText: "Name",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: viewmodel.emailController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),

                  ),
                  SizedBox(height: 16,),
                  TextFormField(
                    controller: viewmodel.phoneController,
                    decoration: InputDecoration(
                      hintText: "Phone",
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16,),
                  TextFormField(
                    controller: viewmodel.placeController,
                    decoration: InputDecoration(
                      hintText: "Place",
                      prefixIcon: Icon(Icons.place),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16,),
                  TextFormField(
                    controller: viewmodel.passwordController,
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16,),
                  TextFormField(
                    controller: viewmodel.pincodeController,
                    decoration: InputDecoration(
                      hintText: "Pincode",
                      prefixIcon: Icon(Icons.pin),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16,),
                  SizedBox(
                    width:MediaQuery.widthOf(context),
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        viewmodel.registration() ;
                      },
                      child: Text("Registration"),
                    ),
                  )
                ],


                      ),
            ),
          ),),
            )
);
      }
      );
  }
}
