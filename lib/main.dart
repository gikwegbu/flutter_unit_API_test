import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_assignment/core/dependencies.dart';
import 'package:flutter_assignment/viewModel/homeViewModel.dart';
import 'package:flutter_assignment/views/home_view.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeViewModel>(
          create: (_) => locator.get<HomeViewModel>(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
