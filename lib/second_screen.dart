import 'package:flutter/material.dart';
import 'package:prov_eg/notifier.dart';
import 'package:prov_eg/listView_screen.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class NewPage extends StatefulWidget {
  NewPage({
    Key? key,
  }) : super(key: key);

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              TextButton(
                  onPressed: () => context.read<NumberModel>().increment(),
                  child: Text(" Press me")),
              Text("${context.watch<NumberModel>().newNumber}"),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ListPage()));
                  },
                  child: Text("Next Page")),
            ],
          ),
        ),
      ),
    );
  }
}
