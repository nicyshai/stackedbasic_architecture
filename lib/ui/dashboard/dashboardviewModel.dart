 import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../app/utils.dart';
import '../../models/category.dart';
enum Taskfilter{all,today,upcoming,completed}

class Dashboardviewmodel extends BaseViewModel {
  List<Task> _alltasks=[];
  List<Task>get alltasks=>_applySearch(_alltasks);
  List<Task>get todaytasks=>_applySearch(_alltasks.where(_isToday).toList());
  List<Task>get upcomingtasks=>_applySearch(_alltasks.where(_isUpcoming).toList());
  List<Task>get completedtasks=>_applySearch(_alltasks.where((task)=>task.iscompleted).toList());
  List<Category> categories = [
    Category(catid: 1, catname: "personal", catimage: FontAwesomeIcons.person, color: Colors.red),
    Category(catid: 2, catname: "Work", catimage: FontAwesomeIcons.upwork, color: Colors.blue),
    Category(catid: 3, catname: "Study", catimage: FontAwesomeIcons.book, color: Colors.green),
    Category(catid: 4, catname: "Shopping", catimage: FontAwesomeIcons.cartShopping, color: Colors.purple),
    Category(catid: 5, catname: "Bills", catimage: FontAwesomeIcons.bilibili, color: Colors.yellow),
  ];



  Taskfilter selectedFilter=Taskfilter.all;
  String _searchText="";

  //filtedtasks
  List<Task>get filteredtasks{
    switch(selectedFilter){
      case Taskfilter.today:return todaytasks;
      case Taskfilter.upcoming:return upcomingtasks;
      case Taskfilter.completed:return completedtasks;
      default:return alltasks;
    }
    }






  Future<void> init() async {
    await loadTasks();
  }

  //search
void search (String value){
    _searchText=value.toLowerCase();
    notifyListeners();

}
List<Task> _applySearch(List<Task> list){
    if(_searchText.isEmpty)return list;
    return list.where((task){
      return task.title.toLowerCase().contains(_searchText) || task.description.toLowerCase().contains(_searchText);
    }).toList();
  }

    //if user changing tabs we need to update selected filter
  void changFilter(Taskfilter filter){
    selectedFilter=filter;
    notifyListeners();
  }
  Future<void> toggleCompletetask(Task task) async {
    if (task.id == null) return;
    task.iscompleted = !task.iscompleted;
    await databaseservice.updateTask(task);
    loadTasks();
  }
  Future<void> loadTasks()  async {
    setBusy(true);
    _alltasks
      ..clear()
      ..addAll(await databaseservice.getTask());
    sortTasks();
    setBusy(false);
    notifyListeners();
  }
  //sort tasks by date
  void sortTasks() {
_alltasks.sort((a, b) {
  try{
    final date1= DateFormat("yyyy-MM-dd").parse(a.date);
    final date2= DateFormat("yyyy-MM-dd").parse(b.date);
    return date1.compareTo(date2);

  }catch(e){
    return 0;
  }
});
  }
  void deleteTask(Task task) async {
    if(task.id==null)return;
    await databaseservice.deleteTask(task.id!);
    await loadTasks();
}
// refresh
Future<void> refresh() async {
  await loadTasks();
}

//filter methods for day wise

bool _isToday(Task task) {
    if(task.iscompleted)return false;
    try{
      final taskdate=DateFormat("yyyy-MM-dd").parse(task.date);
      final today=DateTime.now();
      return taskdate.year==today.year && taskdate.month==today.month && taskdate.day==today.day;
    }
    catch(e){
      print(e);
      return false;
    }
    }

    //upcomming
bool _isUpcoming(Task task) {

   if(task.iscompleted)return false;
   try{
     final taskdate=DateFormat("yyyy-MM-dd").parse(task.date);
     final today=DateTime.now();
     final current=DateTime(today.year,today.month,today.day);
     return taskdate.isAfter(current);
   }
   catch(e){
     print(e);
     return false;
   }
  }

  //counts
int get totalCount=>_alltasks.length;
  int get todaycount=>_alltasks.where(_isToday).length;
  int get upcomingcount=>_alltasks.where(_isUpcoming).length;
  int get highpriorityCount=>_alltasks.where((e){return e.priority=="high" && !e.iscompleted;}).length;



}