import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remindme/models/db_helper.dart';
import 'package:remindme/models/task.dart';
import 'package:remindme/models/task_data.dart';
class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({Key? key}) : super(key: key);
  final taskNameController = TextEditingController();
  String taskTitle = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft:Radius.circular(20))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Title",style: TextStyle(fontSize: 30.0,color: Colors.lightBlueAccent),textAlign: TextAlign.center,),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            decoration: InputDecoration(),
            onChanged: (value){
              taskTitle = value;
            },
            controller: taskNameController,
          ),
          MaterialButton(
            color: Colors.lightBlueAccent,
            child: Text("Add",style: TextStyle(color: Colors.white),),
            onPressed: (){

              Provider.of<TasksData>(context,listen: false).addTasks(name: taskTitle, isChecked: false, creationDate: DateTime.now());
           //   DBHelper().addTasks(Task(), context)
              Navigator.pop(context);


            },
          )
        ],
        ),

      ),
    );
  }
}
