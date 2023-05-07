import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './my_model.dart';
import './home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>(
      create: (context) => MyModel(),
      child: MaterialApp(
        title: 'Art App',
        theme: ThemeData(primarySwatch: Colors.amber),
        home: HomePage(),
      ),
    );
  }
}
