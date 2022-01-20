import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:remindme/models/task.dart';
import 'package:remindme/models/task_data.dart';

class DBHelper{
  Future addTasks(Task task,BuildContext context)async{
  var box = await Hive.openBox('testBox');
  List<Task> taskList = Provider.of<TasksData>(context).tasksList;
  box.put('tasks', taskList);

  }
  Future getTasks(BuildContext context)async{
    var box = await Hive.openBox('testBox');
    Provider.of<TasksData>(context,listen: false).tasksList = box.get('tasks');

  }
}