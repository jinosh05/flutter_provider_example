import 'package:flutter/material.dart';
import 'package:prov_eg/main.dart';
import 'package:prov_eg/notifier.dart';
import 'package:provider/provider.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  TextEditingController _controller = TextEditingController();
  List<Color> _listColor = [
    Colors.pink,
    Colors.black,
    Colors.blue,
    Colors.green,
    Colors.orange
  ];
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => MyApp()));
                  },
                  child: Text("Main Page")),
              Container(
                width: 250,
                child: TextFormField(
                  decoration:
                      InputDecoration(hintText: " Text to be Added to list"),
                  controller: _controller,
                  onEditingComplete: () {
                    print(_controller.text + " is added");
                    context.read<ListModel>().addToList(_controller.text);
                    _controller.clear();
                  },
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    print(_controller.text + " is added");
                    context.read<ListModel>().addToList(_controller.text);
                    _controller.clear();
                  },
                  child: Text(" Add value")),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: context.watch<ListModel>().listDatas.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                      child: Text(
                    context.watch<ListModel>().listDatas[index],
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                        color: _listColor[index < 5 ? index : index % 5]),
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
