import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedbasic/app/app.router.dart';
import 'package:stackedbasic/app/utils.dart';
import 'package:stackedbasic/models/category.dart';
import 'package:stackedbasic/ui/splash/splashViewmodel.dart';

import '../../constants/assets.gen.dart';
import 'TaskCard.dart';
import 'dashboardviewModel.dart';

class Dashboardview extends StatelessWidget {
  const Dashboardview({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<Dashboardviewmodel>.reactive(
      onViewModelReady: (viewModel) => viewModel.init(),
      viewModelBuilder: () => Dashboardviewmodel(),
      builder: (context, viewModel, child) {
        return Builder(
          builder: (context) {
            return DefaultTabController(
              length: 4,

              child: Scaffold(
                backgroundColor: Color(0xffF6F7FB),
                appBar: AppBar(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/todo.png"),
                  ),
                  title: Text("Plan your Day..."),
                  bottom: TabBar(
                    onTap: (index) {
                      switch (index) {
                        case 0:
                          viewModel.changFilter(Taskfilter.all);
                          break;
                        case 1:
                          viewModel.changFilter(Taskfilter.today);
                          break;
                        case 2:
                          viewModel.changFilter(Taskfilter.upcoming);
                          break;
                        case 3:
                          viewModel.changFilter(Taskfilter.completed);
                          break;
                        default:
                          viewModel.changFilter(Taskfilter.all);
                          break;
                      }
                    },
                    isScrollable: false,
                    indicatorColor: Colors.deepPurple,
                    labelColor: Colors.deepPurple,
                    unselectedLabelColor: Colors.grey,
                    labelStyle: TextStyle(fontSize: 12),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorPadding: const EdgeInsets.all(8),
                    indicator: BoxDecoration(
                      color: Colors.deepPurple.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),

                    tabs: [
                      Tab(text: "All"),
                      Tab(text: "Today"),
                      Tab(text: "Upcoming"),
                      Tab(text: "Completed"),
                    ],
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    navigationService.navigateTo(Routes.addTaskView);
                  },
                  child: Icon(Icons.add),
                ),
                body: TabBarView(
                  children: [
                    _alltasks(viewModel),
                    _TaskView(viewModel.todaytasks, viewModel),
                    _TaskView(viewModel.upcomingtasks, viewModel),
                    _TaskView(viewModel.completedtasks, viewModel),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _alltasks(Dashboardviewmodel viewmodel) {
    return RefreshIndicator(
      onRefresh: () {
        return viewmodel.refresh();
      },
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (viewmodel.todaytasks.isNotEmpty) ...[
            // "..."means continue with existing list
            const Text(
              "Todays Task",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 8),
            ...viewmodel.todaytasks.map(
                  (task) =>
                  Taskcard(task: task,
                    categories: viewmodel.categories,
                    onChanged: (_) {
                      viewmodel.toggleCompletetask(task);
                    },
                    onEdit: () {
                      navigationService.navigateTo(
                          Routes.addTaskView, arguments: task);
                    },
                    onDelete: () {
                      viewmodel.deleteTask(task);
                    },
                  ),
            ),
          ],
          if (viewmodel.upcomingtasks.isNotEmpty) ...[
            // "..."means continue with existing list
            const Text(
              "Upcoming Task",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 8),
            ...viewmodel.upcomingtasks.map(
                  (task) =>
                  Taskcard(task: task,
                    categories: viewmodel.categories,
                    onChanged: (_) {
                      viewmodel.toggleCompletetask(task);
                    },
                    onEdit: () {
                      navigationService.navigateTo(
                          Routes.addTaskView, arguments: task);
                    },
                    onDelete: () {
                      viewmodel.deleteTask(task);
                    },
                  ),
            ),
          ],
          if (viewmodel.completedtasks.isNotEmpty) ...[
            // "..."means continue with existing list
            const Text(
              "Completed Task",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 8),
            ...viewmodel.completedtasks.map(
                  (task) =>
                  Taskcard(task: task,
                    categories: viewmodel.categories,
                    onChanged: (_) {
                      viewmodel.toggleCompletetask(task);
                    },
                    onEdit: () {
                      navigationService.navigateTo(
                          Routes.addTaskView, arguments: task);
                    },
                    onDelete: () {
                      viewmodel.deleteTask(task);
                    },
                  ),
            ),
          ],
        ],
      ),
    );
  }
  Widget _TaskView(List<Task>tasks,Dashboardviewmodel viewmodel){
    if(tasks.isEmpty){
      return Center(
        child: Text("No Tasks Found"));

    }
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: tasks.length,
      itemBuilder: (context,index)=>Taskcard(
        task: tasks[index],
        categories: viewmodel.categories,
        onChanged: (_){
          viewmodel.toggleCompletetask(tasks[index]);
        },
        onEdit: (){
          navigationService.navigateTo(Routes.addTaskView,arguments: tasks[index]);
        },
        onDelete: (){
          viewmodel.deleteTask(tasks[index]);
        },
      ),





    );}
}
