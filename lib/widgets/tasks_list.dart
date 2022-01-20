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
    // return Consumer<TasksData>(
    //   builder: (context,taskData,child) => AnimatedList(
    //     key: _key,
    //       initialItemCount: taskData.tasksList.length,
    //       itemBuilder: (context,index,Animation<double> animation){
    //         final task = taskData.tasksList[index];
    //         return Dismissible(
    //           key: Key(task.name),
    //           onDismissed: (direction) {
    //             // Remove the item from the data source.
    //             // setState(() {
    //             //   items.removeAt(index);
    //             // });
    //             taskData.deleteTasks(task);
    //
    //             // Then show a snackbar.
    //             ScaffoldMessenger.of(context)
    //                 .showSnackBar(SnackBar(content: Text('${task.name} dismissed')));
    //           },
    //           background: Container(color: Colors.red),
    //           child: TaskTile(
    //             creationDate: task.creationDate,
    //             name: task.name,
    //             isChecked: task.isChecked,
    //             checkBoxCallBack : (bool? checkboxState){
    //               taskData.toggleTask(task);
    //             },
    //             onLongPress: (){
    //               taskData.deleteTasks(task);
    //             },
    //
    //           ),
    //         );
    //       }),
    //
    // );
    return Consumer<TasksData>(
      builder: (context,taskData,child) => ListView.builder(
          itemCount: taskData.tasksBox.length,
          itemBuilder: (context,index){
            final task = taskData.tasksBox.getAt(index);
            return Dismissible(
              // key: Key(task?.name ?? ""),
              key: UniqueKey(),
              onDismissed: (direction) {
                // Remove the item from the data source.
                // setState(() {
                //   items.removeAt(index);
                // });
                taskData.deleteTasks(task!,index);

                // Then show a snackbar.
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('${task.name} dismissed')));
              },
              background: Container(color: Colors.red),
              child: TaskTile(
                creationDate: task?.creationDate ?? DateTime.now(),
                name: task?.name ?? "",
                isChecked: task?.isChecked ?? false,
                checkBoxCallBack : (bool? checkboxState){
                  taskData.toggleTask(task!,index);
                },
                onLongPress: (){
                  taskData.deleteTasks(task!,index);
                },

              ),
            );
          }),

    );
  }
}
