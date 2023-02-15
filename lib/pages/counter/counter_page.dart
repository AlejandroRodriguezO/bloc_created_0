import 'dart:developer';

import 'package:bloc_pattern/pages/counter/bloc/counter_events.dart';
import 'package:bloc_pattern/state_management/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bloc/counter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    log('build');
    return BlocProvider<CounterBloc>(
      create: (_) => CounterBloc(),
      child: Builder(builder: (context) {
        final CounterBloc bloc = context.watch();
        return Scaffold(
          body: Center(
            child: Text(
              bloc.state.toString(),
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          floatingActionButton: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () => bloc.add(IncrementEvent(5)),
              ),
              const SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                child: const Icon(Icons.remove),
                onPressed: () => bloc.add(DecrementEvent(2)),
              ),
            ],
          ),
        );
      }),
    );
  }
}
