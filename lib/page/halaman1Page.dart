import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../bloc/appbloc.dart';
import '../bloc/appState.dart';
import '../bloc/appEvent.dart';

class Halaman1Page extends StatelessWidget {
  const Halaman1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Appbloc, Appstate>(
      builder: (context, state) {
        if (state is InitialState) {
          return _halaman1Page(context, 0);
        } else if (state is UpdateState) {
          return _halaman1Page(context, state.nilai);
        }
        return Container();
      },
    );
  }
}

Widget _halaman1Page(BuildContext context, int nilai) {
  return Scaffold(
    appBar: AppBar(
      title: const Text("Halaman Increment & Decrement"),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Counter Number",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            nilai.toString(),
            style: const TextStyle(fontSize: 40),
          ),
        ],
      ),
    ),
    floatingActionButton: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () {
            context.read<Appbloc>().add(NumberIncrementEvent());
          },
          child: const Icon(Icons.add),
        ),
        const SizedBox(height: 10), // Spacer
        FloatingActionButton(
          onPressed: () {
            context.read<Appbloc>().add(NumberDecrementEvent());
          },
          child: const Icon(Icons.remove),
        ),
      ],
    ),
  );
}
