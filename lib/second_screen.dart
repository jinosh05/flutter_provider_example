import 'package:flutter/material.dart';
import 'package:prov_eg/list_data_screen.dart';
import 'package:prov_eg/notifier.dart';
import 'package:provider/provider.dart';

class NewPage extends StatefulWidget {
  const NewPage({
    super.key,
  });

  @override
  NewPageState createState() => NewPageState();
}

class NewPageState extends State<NewPage> {
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
