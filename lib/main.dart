import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/home/home_bloc.dart';
import './repo/home_repo.dart';
import './view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BlocProvider(
          create: (context) {
            return HomeBloc(network: Fetching());
          },
          child: const Home(),
        ),
      ),
    );
  }
}
