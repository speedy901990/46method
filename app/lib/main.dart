import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import 'widgets/brew_page.dart';
import 'widgets/settings_page.dart';

void main() => runApp(MyApp());

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

class Method46 extends StatefulWidget {
  const Method46({
    Key? key,
  }) : super(key: key);

  @override
  State<Method46> createState() => _Method46State();
}

class _Method46State extends State<Method46> {
  dynamic selected;
  var heart = false;
  PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('4-6 method'),
      ),
      //extendBody: true, //to make floating action button notch transparent

      //to avoid the floating action button overlapping behavior,
      // when a soft keyboard is displayed
      //resizeToAvoidBottomInset: false,

      bottomNavigationBar: StylishBottomBar(
        items: [
          AnimatedBarItems(
              icon: const Icon(
                Icons.coffee_maker_outlined,
              ),
              selectedIcon: const Icon(
                Icons.coffee_maker,
              ),
              backgroundColor: Colors.amber,
              selectedColor: Colors.deepOrangeAccent,
              title: const Text('Brew')),
          AnimatedBarItems(
              icon: const Icon(
                Icons.settings_outlined,
              ),
              selectedIcon: const Icon(
                Icons.settings,
              ),
              backgroundColor: Colors.brown,
              selectedColor: Colors.amberAccent,
              title: const Text('Settings')),
        ],
        iconSize: 32,
        barAnimation: BarAnimation.fade,
        iconStyle: IconStyle.animated,
        hasNotch: true,
        fabLocation: StylishBarFabLocation.end,
        opacity: 0.3,
        currentIndex: selected ?? 0,
        onTap: (index) {
          controller.jumpToPage(index!);
          setState(() {
            selected = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            heart = !heart;
          });
        },
        backgroundColor: Colors.white,
        child: Icon(
          heart ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
          color: Colors.red,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: SafeArea(
        child: PageView(
          controller: controller,
          children: const [
            BrewPage(),
            SettingsPage(),
          ],
        ),
      ),
    );
  }
}
