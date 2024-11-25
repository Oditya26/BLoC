import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/appbloc.dart';
import '../bloc/appEvent.dart';
import '../bloc/appState.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController inputController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Increment/Decrement with Input"),
      ),
      body: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          final counter = state is UpdatedState ? state.counter : 0;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Counter Value: $counter",
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: inputController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Enter a number",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,  // Tombol plus berwarna biru
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(24), // Membuat tombol menjadi bulat
                      ),
                      onPressed: () {
                        final input = int.tryParse(inputController.text);
                        if (input != null) {
                          context.read<AppBloc>().add(IncrementEvent(input));
                          inputController.clear();
                        }
                      },
                      child: const Text(
                        "+",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold, // Tulisan lebih besar dan tebal
                          color: Colors.white, // Warna teks menjadi putih
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,  // Tombol minus berwarna merah
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(24), // Membuat tombol menjadi bulat
                      ),
                      onPressed: () {
                        final input = int.tryParse(inputController.text);
                        if (input != null) {
                          context.read<AppBloc>().add(DecrementEvent(input));
                          inputController.clear();
                        }
                      },
                      child: const Text(
                        "-",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold, // Tulisan lebih besar dan tebal
                          color: Colors.white, // Warna teks menjadi putih
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
