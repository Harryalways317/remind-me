import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remindme/models/task_data.dart';
import 'package:remindme/widgets/tasks_list.dart';

import 'add_task_screen.dart';
class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        showModalBottomSheet(context: context, builder:(context) => SingleChildScrollView(child: Container( padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),child:AddTaskScreen() ,)),isScrollControlled: true);
      },
      child: Icon(Icons.add),backgroundColor: Colors.lightBlueAccent,),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 60,bottom: 30,left: 30,right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(child: Icon(Icons.list,size: 30,color: Colors.lightBlueAccent,),backgroundColor: Colors.white,radius: 30,),
                SizedBox(height: 10,),
                Text("Remind ME",style: TextStyle(fontSize: 50.0,color: Colors.white,fontWeight: FontWeight.w700),),
                Text("${Provider.of<TasksData>(context).tasksBox.length} Tasks",style: TextStyle(fontSize: 18,color: Colors.white),),


              ],
            ),
          ),
          Expanded(
            child: Container(
                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30),)
            ),
            child: TasksList(),
          ),
          ),

        ],
      ),
    );
  }
}

