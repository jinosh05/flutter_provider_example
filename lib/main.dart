import 'package:flutter/material.dart';
import 'package:prov_eg/second_screen.dart';
import 'package:prov_eg/notifier.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => NumberModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => ListModel(),
      )
    ],
    child: const MaterialApp(home: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Page"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              // onPressed: () => context.read<Counter>().increment(),
              TextButton(
                  onPressed: () => context.read<NumberModel>().increment(),
                  child: const Text(" Increment")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const NewPage()));
                  },
                  child: const Text("Next Page")),
              Text("${context.watch<NumberModel>().newNumber}"),
            ],
          ),
        ),
      ),
    );
  }
}
