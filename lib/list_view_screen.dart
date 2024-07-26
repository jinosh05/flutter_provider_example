import 'package:flutter/material.dart';
import 'package:prov_eg/main.dart';
import 'package:prov_eg/notifier.dart';
import 'package:provider/provider.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  ListPageState createState() => ListPageState();
}

class ListPageState extends State<ListPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Color> _listColor = [
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
      appBar: AppBar(
        title: const Text("List Notifier UI"),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const MyApp()));
            },
            child: const Icon(
              Icons.home,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: 250,
                child: TextFormField(
                  decoration: const InputDecoration(
                      hintText: " Text to be Added to list"),
                  controller: _controller,
                  onEditingComplete: () {
                    debugPrint("${_controller.text} is added");
                    context.read<ListModel>().addToList(_controller.text);
                    _controller.clear();
                  },
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    debugPrint("${_controller.text} is added");
                    context.read<ListModel>().addToList(_controller.text);
                    _controller.clear();
                  },
                  child: const Text(" Add value")),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
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
