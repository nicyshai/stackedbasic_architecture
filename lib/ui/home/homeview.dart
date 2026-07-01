import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'homeviewmodel.dart';

class Homeview extends StatelessWidget {
  final num id;
  const Homeview({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<Homeviewmodel>.reactive(
      viewModelBuilder: () => Homeviewmodel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Home"),
            actions: [
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: viewModel.logout,
                tooltip: "Logout",
              ),
            ],
          ),
          body: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home, size: 100, color: Colors.blue),
                SizedBox(height: 20),
                Text(
                  "Welcome to Task Manager",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "Manage your tasks efficiently",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: viewModel.goToAddTask,
            child: const Icon(Icons.add),
            tooltip: "Add Task",
          ),
        );
      },
    );
  }
}
