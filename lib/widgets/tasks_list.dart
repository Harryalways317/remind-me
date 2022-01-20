import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remindme/models/task.dart';
import 'package:remindme/models/task_data.dart';
import 'package:remindme/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
   TasksList({Key? key}) : super(key: key);

  List<Task> tasksList = [ Task(isChecked: false,name: "Task1",creationDate: DateTime.now())];

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksData>(
      builder: (context,taskData,child) => ListView.builder(
          itemCount: taskData.tasksList.length,
          itemBuilder: (context,index){
            final task = taskData.tasksList[index];
            return TaskTile(
              creationDate: task.creationDate,
              name: task.name,
              isChecked: task.isChecked,
              checkBoxCallBack : (bool? checkboxState){
                taskData.toggleTask(task);
              },
              onLongPress: (){
                taskData.deleteTasks(task);
              },

            );
          }),

    );
  }
}
