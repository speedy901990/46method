import 'package:app/models/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:group_button/group_button.dart';

class BrewPage extends StatefulWidget {
  const BrewPage({super.key});

  @override
  State<BrewPage> createState() => _BrewPageState();
}

class _BrewPageState extends State<BrewPage> {
  var brewSettingSwitchValue = false;
  final _brewProfileController = GroupButtonController();

  @override
  void initState() {
    _brewProfileController.selectIndex(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    double totalHeight = MediaQuery.of(context).size.height;
    print("${totalWidth}, ${totalHeight}");
    return LayoutBuilder(builder: (ctx, constraints) {
      double constraintWidth = constraints.maxWidth;
      double constraintHeight = constraints.maxHeight;
      print("${constraintWidth}, ${constraintHeight}");
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: totalHeight / 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                        child: Container(
                          height: 50,
                          width: 50,
                          child: Center(child: Text('Coffee')),
                          color: Colors.blueGrey,
                        ),
                      ),
                      Switch(
                        activeTrackColor: Theme.of(context).colorScheme.surface,
                        inactiveTrackColor:
                            Theme.of(context).colorScheme.surface,
                        activeColor: Theme.of(context).colorScheme.secondary,
                        inactiveThumbColor:
                            Theme.of(context).colorScheme.secondary,
                        value: brewSettingSwitchValue,
                        onChanged: (value) =>
                            setState(() => brewSettingSwitchValue = value),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                        child: Container(
                          height: 50,
                          width: 50,
                          child: Center(child: Text('Water')),
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                      child: Container(
                        height: 50,
                        width: 210,
                        child: Center(child: Text('Grind')),
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: totalHeight / 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Brewing Profile',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GroupButton(
                      controller: _brewProfileController,
                      buttons: ['sweet', 'balanced', 'acidic'],
                      options: GroupButtonOptions(
                          selectedShadow: const [],
                          groupingType: GroupingType.wrap,
                          elevation: 0,
                          borderRadius: BorderRadius.circular(20),
                          selectedColor: Theme.of(context).colorScheme.surface,
                          unselectedColor:
                              Theme.of(context).colorScheme.surfaceVariant),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: totalHeight / 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Brew'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Water',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Text('0 g',
                            style: Theme.of(context).textTheme.bodyText1),
                        Text('100 g',
                            style: Theme.of(context).textTheme.bodyText1),
                        Text('200 g',
                            style: Theme.of(context).textTheme.bodyText1),
                        Text('300 g',
                            style: Theme.of(context).textTheme.bodyText1),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Time',
                            style: Theme.of(context).textTheme.headline2),
                        Text('0:00 min',
                            style: Theme.of(context).textTheme.bodyText1),
                        Text('0:45 min',
                            style: Theme.of(context).textTheme.bodyText1),
                        Text('1:15 min',
                            style: Theme.of(context).textTheme.bodyText1),
                        Text('2:00 min',
                            style: Theme.of(context).textTheme.bodyText1),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Progress',
                            style: Theme.of(context).textTheme.headline2),
                        FaIcon(FontAwesomeIcons.mugHot)
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      );
    });
  }
}
