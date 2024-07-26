import 'package:flutter/material.dart';
import 'package:prov_eg/list/list_data_screen.dart';
import 'package:prov_eg/numbers/notifier.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Page"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              TextButton(
                  onPressed: () => context.read<NumberModel>().increment(),
                  child: const Text(" Press me")),
              Text("${context.watch<NumberModel>().newNumber}"),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ListDataScreen()));
                  },
                  child: const Text("Next Page")),
            ],
          ),
        ),
      ),
    );
  }
}
