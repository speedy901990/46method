import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: App(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.brown)
            .copyWith(secondary: Colors.amber),
      ),
    );
  }
}

class App extends StatelessWidget {
  List<IconData> _iconList = [
    Icons.coffee_maker,
    Icons.settings,
  ];
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('4-6 method'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Coffee, Grind, Water setting'),
              ],
            ),
          ),
          Container(
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Brewing Profile'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GroupButton(
                      buttons: ['sweet', 'balanced', 'acidic'],
                      options: GroupButtonOptions(
                        selectedShadow: const [],
                        groupingType: GroupingType.wrap,
                        elevation: 0,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Brew'),
              ],
            ),
          ),
          Container(
            height: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Brewing Progress'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: _iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) {},
        //other params
      ),
    );
  }
}
