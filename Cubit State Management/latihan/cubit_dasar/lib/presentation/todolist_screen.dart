import 'package:cubit_dasar/cubit/todo_list_cubit/todo_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodolistScreen extends StatelessWidget {
  TodolistScreen({super.key});

  final notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: notesController,
          ),
          ElevatedButton(
            onPressed: () {
              context.read<TodoListCubit>().addNotes(notesController.text);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}
