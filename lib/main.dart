import 'package:flutter/material.dart';
import 'package:prov_eg/list/list_notifier.dart';
import 'package:prov_eg/numbers/main_page.dart';
import 'package:prov_eg/numbers/notifier.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => NumberModel(),
      ),
      ChangeNotifierProvider(
        create: (_) => ListNotifier(),
      )
    ],
    child: const MaterialApp(home: MainPage()),
  ));
}
