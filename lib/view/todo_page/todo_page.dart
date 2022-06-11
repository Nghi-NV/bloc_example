import 'package:bloc_example/model/todo_model.dart';
import 'package:bloc_example/view_model/bloc/todo_bloc.dart';
// import 'package:bloc_example/view_model/cubit/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  int userId = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo Page')),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.todos.length,
                  itemBuilder: (context, index) {
                    final todo = state.todos[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Container(
                        height: 80,
                        decoration: const BoxDecoration(color: Colors.amber),
                        child: ListTile(
                          title: Text(todo.title ?? 'No title'),
                          trailing: Checkbox(
                            value: todo.isDone,
                            onChanged: (value) {
                              // context.read<TodoBloc>().toggleTodo(todo);
                              context
                                  .read<TodoBloc>()
                                  .add(TodoEvent.toggleTodo(todo) as TodoEvent);
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // context.read<TodoCubit>().addTodo(const Todo(
                    //       title: 'Todo 1',
                    //       isDone: false,
                    //       id: 1,
                    //       userId: 10,
                    //     ));
                    userId++;
                    context.read<TodoBloc>().add(TodoEvent.addTodo(
                          Todo(
                            title: 'Todo 1',
                            isDone: false,
                            id: 1,
                            userId: userId,
                          ),
                        ));
                  },
                  child: const Text('Add Todo'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
