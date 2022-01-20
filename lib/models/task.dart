import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task{
  @HiveField(0)
  String name;
  @HiveField(1)
  bool isChecked;
  @HiveField(2)
  DateTime creationDate;

  toggleTaskCheck(){
    isChecked = !isChecked;
  }

  Task({required this.name,required this.isChecked,required this.creationDate});
}
