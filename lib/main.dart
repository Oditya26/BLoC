import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/appbloc.dart';
import 'page/mainPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(),
      child: MaterialApp(
        title: "Increment/Decrement App",
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const MainPage(),
      ),
    );
  }
}
