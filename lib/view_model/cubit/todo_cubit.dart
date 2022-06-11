import 'package:bloc_example/model/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_state.dart';
part 'todo_cubit.freezed.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(const TodoState.initial(<Todo>[]));

  void addTodo(Todo todo) {
    emit(state.copyWith(
      todos: state.todos.toList()..add(todo),
    ));
  }

  void toggleTodo(Todo todo) {
    emit(state.copyWith(
      todos: state.todos
          .map((t) => t == todo ? t.copyWith(isDone: !t.isDone) : t)
          .toList(),
    ));
  }
}
