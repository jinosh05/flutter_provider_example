import 'package:flutter/material.dart';
import 'package:prov_eg/numbers/notifier.dart';
import 'package:prov_eg/numbers/second_screen.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

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
                  child: const Text(
                    " Increment",
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SecondScreen()));
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
