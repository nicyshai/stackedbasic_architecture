import 'dart:ui';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Category {
  int catid;
  String catname;
  FaIconData catimage;

  Color color;

  Category({required this.catid, required this.catname, required this.catimage, required this.color});
}



class Task{
  int? id;
 String title;
 String description;
 int catid;
 String date;
 String time;
 String priority;
 bool iscompleted;

  Task({ this.id, required this.title, required this.description, required this.catid, required this.date, required this.time,
    required this.priority, required this.iscompleted});
  Map<String,dynamic>toMap()=>{
    'id':id,
    'title':title,
    'description':description,
    'catid':catid,
    'date':date,
    'time':time,
    'priority':priority,
    'iscompleted':iscompleted,
  };
  factory Task.fromMap(Map<String,dynamic>map)=>Task(
id: map["id"],
title: map["title"],
description: map["description"],
catid: map["catid"],
date: map["date"],
time: map["time"],
priority: map["priority"],
iscompleted: map["iscompleted"],
  );

  }
