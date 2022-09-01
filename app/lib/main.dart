import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '4-6 method',
      home: Scaffold(
        appBar: AppBar(title: const Text('4-6 method')),
        body: const Center(child: Text("Hello Coffee!")),
      ),
    );
  }
}
