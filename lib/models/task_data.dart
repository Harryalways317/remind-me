import 'package:flutter/foundation.dart';
import 'package:remindme/models/task.dart';

class TasksData extends ChangeNotifier{
  List<Task> tasksList = [
    Task(isChecked: false,name: "Task1",creationDate: DateTime.now()),

  ];



  addTasks({required String name, required bool isChecked,required DateTime creationDate}){
    tasksList.add(Task(name: name, isChecked: isChecked, creationDate: creationDate));

    notifyListeners();
  }

  deleteTasks(Task task){
    tasksList.remove(task);
    notifyListeners();
  }
  
  toggleTask(Task task){
    task.toggleTaskCheck();

    notifyListeners();
  }

  
  



}