import 'package:cubit_dasar/cubit/counter_cubit/counter_cubit.dart';
import 'package:cubit_dasar/cubit/counter_cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(), 
      child: _Content());
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter Screen')),
      body: Column(
        children: [
          BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) {
              return Center(
                child: Text(
                  state.counterValue.toString(),
                  style: TextStyle(fontSize: 24),
                ),
              );
            },
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Call increment method
                  context.read<CounterCubit>().increment();
                },
                child: Text('Increment'),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  // Call decrement method
                  context.read<CounterCubit>().decrement();
                },
                child: Text('Decrement'),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Call reset method
              context.read<CounterCubit>().resetState();
            },
            child: Text('Reset'),
          ),
        ],
      ),
    );
  }
}
