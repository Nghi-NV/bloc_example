import 'package:bloc_example/di/injection.dart';
import 'package:bloc_example/model/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'todo_event.dart';
part 'todo_state.dart';
part 'todo_bloc.freezed.dart';

  // keySharefPref = 'todo_list';
class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const _Initial([])) {
    on<_Started>(_onStart);
    on<_AddTodo>(_onAddTodo);
    on<_ToggleTodo>(_onToggleTodo);
  }

  void _onStart(_Started event, emit) {
    // SharedPreferences preferences = sl<SharedPreferences>();
    // preferences.getString();
    emit(const _Initial(<Todo>[]));
  }

  void _onAddTodo(_AddTodo event, emit) {
    emit(state.copyWith(
      todos: state.todos.toList()..add(event.todo),
    ));
  }

  void _onToggleTodo(_ToggleTodo event, emit) {
    emit(state.copyWith(
      todos: state.todos
          .toList()
          .map((t) =>
              t.userId == event.todo.userId ? t.copyWith(isDone: !t.isDone) : t)
          .toList(),
    ));
  }
}
