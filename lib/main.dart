import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/appbloc.dart';
import 'page/halaman1Page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<Appbloc>(
      create: (context) => Appbloc(),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        routes: {
          '/': (context) => const Halaman1Page(),
        },
        initialRoute: '/',
      ),
    );
  }
}
