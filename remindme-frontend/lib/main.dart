import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:remindme/models/db_helper.dart';
import 'package:remindme/models/task_data.dart';
import 'package:remindme/screens/tasks_screen.dart';

import 'models/task.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final applicatonDocumentDir =
  await getApplicationDocumentsDirectory();
  Hive.init(applicatonDocumentDir.path);


  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>('TODOs');
  //await Hive.initFlutter();
  // var box = await Hive.openBox('testBox');
  // box.put('tasks', [1,2,3]);
  // print(box.values);

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TasksData()),
      ],

      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}

