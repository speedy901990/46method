import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:app/widgets/navigation_screen.dart';
import 'package:app/models/hex_color.dart';
import 'package:app/widgets/brew_page.dart';
import 'package:app/widgets/settings_page.dart';

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
        colorScheme: ColorScheme.fromSwatch(
                primarySwatch: HexColor.getPrimarySwatch('#7A6755'))
            .copyWith(
          primary: HexColor('#7A6755'),
          secondary: HexColor('#FFA400'),
          surface: HexColor('#74AF94'),
          surfaceVariant: HexColor('#C6C2B9'),
          background: HexColor('#373A36'),
        ),
        textTheme: ThemeData.dark().textTheme.copyWith(
              bodyText1: const TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              headline1: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  color: HexColor('#F4EEC5'),
                  fontSize: 20),
              headline2: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  color: HexColor('#F4EEC5'),
                  fontSize: 15),
              headline6: const TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
      ),
    );
  }
}

class Method46 extends StatefulWidget {
  @override
  State<Method46> createState() => _Method46State();
}

class _Method46State extends State<Method46> with TickerProviderStateMixin {
  final autoSizeGroup = AutoSizeGroup();
  var _bottomNavIndex = 0; //default index of a first screen

  late AnimationController _fabAnimationController;
  late AnimationController _borderRadiusAnimationController;
  late Animation<double> fabAnimation;
  late Animation<double> borderRadiusAnimation;
  late CurvedAnimation fabCurve;
  late CurvedAnimation borderRadiusCurve;
  late AnimationController _hideBottomBarAnimationController;
  late AppBar _appBar;
  late AnimatedBottomNavigationBar _bottomNavBar;

  final iconList = [
    {Icons.coffee_maker, 'Brew'},
    {Icons.settings, 'Settings'},
  ];

  @override
  void initState() {
    super.initState();

    _fabAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _borderRadiusAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    fabCurve = CurvedAnimation(
      parent: _fabAnimationController,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    borderRadiusCurve = CurvedAnimation(
      parent: _borderRadiusAnimationController,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );

    fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
    borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
      borderRadiusCurve,
    );

    _hideBottomBarAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    Future.delayed(
      const Duration(seconds: 1),
      () => _fabAnimationController.forward(),
    );
    Future.delayed(
      const Duration(seconds: 1),
      () => _borderRadiusAnimationController.forward(),
    );
  }

  bool _onScrollNotification(ScrollNotification notification) {
    if (notification is UserScrollNotification &&
        notification.metrics.axis == Axis.vertical) {
      switch (notification.direction) {
        case ScrollDirection.forward:
          _hideBottomBarAnimationController.reverse();
          _fabAnimationController.forward(from: 0);
          break;
        case ScrollDirection.reverse:
          _hideBottomBarAnimationController.forward();
          _fabAnimationController.reverse(from: 1);
          break;
        case ScrollDirection.idle:
          break;
      }
    }
    return false;
  }

  @override
  void didChangeDependencies() {
    final systemTheme = SystemUiOverlayStyle.dark.copyWith(
      systemNavigationBarColor: Theme.of(context).colorScheme.background,
      systemNavigationBarIconBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemTheme);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _appBar = AppBar(
      title: const Center(
        child: Text(
          "4-6 Method",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
    );

    _bottomNavBar = AnimatedBottomNavigationBar.builder(
      itemCount: iconList.length,
      tabBuilder: (int index, bool isActive) {
        final color =
            isActive ? Theme.of(context).colorScheme.secondary : Colors.white;
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconList[index].first as IconData,
              size: 24,
              color: color,
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: AutoSizeText(
                iconList[index].last as String,
                maxLines: 1,
                style: TextStyle(color: color),
                group: autoSizeGroup,
              ),
            )
          ],
        );
      },
      backgroundColor: Theme.of(context).colorScheme.background,
      splashColor: Theme.of(context).colorScheme.secondary,
      activeIndex: _bottomNavIndex,
      notchAndCornersAnimation: borderRadiusAnimation,
      splashSpeedInMilliseconds: 300,
      notchSmoothness: NotchSmoothness.defaultEdge,
      gapLocation: GapLocation.center,
      leftCornerRadius: 32,
      rightCornerRadius: 32,
      onTap: (index) => setState(() => _bottomNavIndex = index),
      hideAnimationController: _hideBottomBarAnimationController,
      shadow: BoxShadow(
        offset: const Offset(0, 1),
        blurRadius: 12,
        spreadRadius: 0.5,
        color: Theme.of(context).colorScheme.secondary,
      ),
      height: 60,
    );

    final mediaQuery = MediaQuery.of(context);
    final pageHeight = mediaQuery.size.height -
        _appBar.preferredSize.height -
        mediaQuery.padding.top -
        _bottomNavBar.height!;

    return Scaffold(
      extendBody: true,
      appBar: _appBar,
      body: NotificationListener<ScrollNotification>(
        onNotification: _onScrollNotification,
        child: _bottomNavIndex == 0
            ? NavigationScreen(
                Container(
                  child: const BrewPage(),
                  height: pageHeight,
                ),
              )
            : NavigationScreen(
                Container(
                  child: const SettingsPage(),
                  height: pageHeight,
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: const FaIcon(FontAwesomeIcons.mugHot),
        onPressed: () {
          _fabAnimationController.reset();
          _borderRadiusAnimationController.reset();
          _borderRadiusAnimationController.forward();
          _fabAnimationController.forward();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _bottomNavBar,
    );
  }
}
