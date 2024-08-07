import 'package:flutter/material.dart';
import 'package:flutter_assignment/viewModel/home_viewModel.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isFetchingData = false;
  late HomeViewModel homeCtrl;

  @override
  void initState() {
    homeCtrl = context.read<HomeViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    homeCtrl = context.watch<HomeViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Testing"),
      ),
      body: Center(
        child: homeCtrl.isLoading
            ? const CircularProgressIndicator.adaptive()
            : TextButton(
                onPressed: fetchData,
                child: const Text("Fetch Data"),
              ),
      ),
    );
  }

  void fetchData() async {
    await homeCtrl.getData("1");
  }
}
