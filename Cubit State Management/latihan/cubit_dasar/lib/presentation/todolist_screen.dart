import 'package:cubit_dasar/cubit/todo_list_cubit/todo_list_cubit.dart';
import 'package:cubit_dasar/cubit/todo_list_cubit/todo_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodolistScreen extends StatelessWidget {
  const TodolistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoListCubit(),
      child: _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  _Content();

  final notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: notesController,
              decoration: InputDecoration(
                hintText: 'Add Notes',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                var inputValue = notesController.text;
                context.read<TodoListCubit>().addNotes(inputValue);
                notesController.clear();
              },
              child: Text('Save'),
            ),
            const SizedBox(height: 10.0),
            BlocBuilder<TodoListCubit, TodoListState>(
              builder: (context, state) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.notes.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(state.notes[index]),
                        trailing: IconButton(
                          onPressed: () {
                            context.read<TodoListCubit>().deleteNotes(index);
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
