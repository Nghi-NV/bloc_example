part of 'todo_bloc.dart';

@freezed
class TodoEvent with _$TodoEvent {
  const factory TodoEvent.started() = _Started;

  const factory TodoEvent.addTodo(Todo todo) = _AddTodo;

  const factory TodoEvent.toggleTodo(Todo todo) = _ToggleTodo;
}
