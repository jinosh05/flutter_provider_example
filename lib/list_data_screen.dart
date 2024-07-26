import 'package:flutter/material.dart';
import 'package:prov_eg/main.dart';
import 'package:prov_eg/notifier.dart';
import 'package:provider/provider.dart';

class ListDataScreen extends StatefulWidget {
  const ListDataScreen({super.key});

  @override
  ListDataScreenState createState() => ListDataScreenState();
}

class ListDataScreenState extends State<ListDataScreen> {
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Text to be added to list",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    ),
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
                const SizedBox(height: 16),
                ElevatedButton(
                    onPressed: () {
                      debugPrint("${_controller.text} is added");
                      context.read<ListModel>().addToList(_controller.text);
                      _controller.clear();
                    },
                    child: const Text("Add value")),
                const SizedBox(height: 16),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: context.watch<ListModel>().listDatas.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Center(
                          child: Text(
                            context.watch<ListModel>().listDatas[index],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                              color: _listColor[index % _listColor.length],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
