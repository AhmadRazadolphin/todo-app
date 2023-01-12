import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/ModelClasses/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTask>((_onAddEvent));
    on<UpdateTask>((_onUpdateEvent));
    on<DeleteTask>((_onDeleteEvent));
  }
  _onAddEvent(AddTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
      allTasks: List.from(state.allTasks)..add(event.task),
    ));
  }

  _onUpdateEvent(UpdateTask event, Emitter<TaskState> emit) {}

  _onDeleteEvent(DeleteTask event, Emitter<TaskState> emit) {}
}
