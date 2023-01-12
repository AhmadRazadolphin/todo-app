import 'package:flutter/material.dart';
import 'package:todo_app/Bloc/TaskBloc/task_bloc.dart';
import 'package:todo_app/ModelClasses/task.dart';
import 'package:todo_app/Screens/Tasks_screen.dart';

import 'Bloc/bloc_export_file.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc()..add(AddTask(task: Task(title: "Task1"))),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TasksScreen(),
      ),
    );
  }
}
