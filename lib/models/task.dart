class Task{
  String name;
  bool isChecked;
  DateTime creationDate;

  toggleTaskCheck(){
    isChecked = !isChecked;
  }

  Task({required this.name,required this.isChecked,required this.creationDate});
}