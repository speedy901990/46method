import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/stylish_navigation_bar.dart';
import 'widgets/animated_navigation_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '4-6 Method',
      home: Method46(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.brown)
            .copyWith(secondary: Colors.amber),
      ),
    );
  }
}

class Method46 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedNavigationBar(
      title: '4-6 Method',
    );
    //return StylishNavigationBar();
  }
}
