import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remindme/models/task_data.dart';

class TaskTile extends StatelessWidget {
  String name;
  bool isChecked;
  DateTime creationDate;
  Function(bool?)?  checkBoxCallBack;
  Function() onLongPress;
  TaskTile({Key? key,required this.name,required this.isChecked,required this.creationDate,required this.checkBoxCallBack,required this.onLongPress}) : super(key: key);





  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPress,
      subtitle: Text("${creationDate.day}/${creationDate.month} ${creationDate.hour}:${creationDate.minute}"),
      title: TextField(
        controller: TextEditingController(text:name),
        decoration: InputDecoration(border: InputBorder.none),
        // child: Text(name, style: TextStyle(s
        //     decoration: isChecked ? TextDecoration.lineThrough : null),),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked, onChanged: checkBoxCallBack,
      ),

      //TaskCheckBox(callback: isCheckedCallback,state: isChecked,),
    );
  }
}



