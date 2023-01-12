import 'package:flutter/material.dart';
import 'package:todo_app/Bloc/TaskBloc/task_bloc.dart';
import 'package:todo_app/ModelClasses/task.dart';
import 'package:todo_app/widgets/task_list.dart';

import '../Bloc/bloc_export_file.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({Key? key}) : super(key: key);

  // List<Task> tasksList = [
  //   Task(title: 'Task1'),
  //   Task(title: 'Task2'),
  //   Task(title: 'Task3'),
  // ];
  TextEditingController titleController = TextEditingController();

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Text(
                        "Add Task",
                        style: TextStyle(fontSize: 24),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        autofocus: true,
                        controller: titleController,
                        decoration: const InputDecoration(
                            label: Text('Text'), border: OutlineInputBorder()),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                var task = Task(title: titleController.text);
                                context
                                    .read<TaskBloc>()
                                    .add(AddTask(task: task));
                              },
                              child: const Text('Add')),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel')),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> tasksList = state.allTasks;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Task App'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              )
            ],
          ),
          body: Column(
            children: [
              const Center(
                child: Chip(
                  label: Text('Task : '),
                ),
              ),
              TasksList(tasksList: tasksList),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _addTask(context);
            },
            tooltip: 'Add task',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
