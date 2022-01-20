import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:remindme/models/task.dart';

class TasksData extends ChangeNotifier{
  // List<Task> tasksList = [
  //   Task(isChecked: false,name: "Task1",creationDate: DateTime.now()),
  //
  // ];



  Box<Task> tasksBox  = Hive.box<Task>('TODOs');







  addTasks({required String name, required bool isChecked,required DateTime creationDate}){
    //tasksList.add(Task(name: name, isChecked: isChecked, creationDate: creationDate));
    tasksBox.add(Task(name: name, isChecked: isChecked, creationDate: creationDate));

    notifyListeners();
  }

  deleteTasks(Task task,index){
    //tasksList.remove(task);
    //tasksBox.delete(task);
    tasksBox.deleteAt(index);
    notifyListeners();
  }
  
  toggleTask(Task task,int index)async{




    tasksBox.deleteAt(index);

    task.toggleTaskCheck();

   tasksBox.add(task);
    notifyListeners();



    notifyListeners();
  }

  
  



}