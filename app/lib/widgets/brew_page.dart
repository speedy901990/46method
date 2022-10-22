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

  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    double totalHeight = MediaQuery.of(context).size.height;
    print("${totalWidth}, ${totalHeight}");
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
                        child: Text('Coffee'),
                        color: Colors.blueGrey,
                      ),
                    ),
                    Switch(
                      activeTrackColor: Colors.green,
                      inactiveTrackColor: Colors.green,
                      activeColor: Colors.amber,
                      inactiveThumbColor: Colors.orangeAccent,
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
                        child: Text('Water'),
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
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                    child: Container(
                      height: 50,
                      width: 50,
                      child: Text('Grinder'),
                      color: Colors.blueGrey,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                    child: Container(
                      height: 50,
                      width: 50,
                      child: Text('Ground Size'),
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
          height: totalHeight / 2,
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
                      Text('Water'),
                      Text('0 g'),
                      Text('100 g'),
                      Text('200 g'),
                      Text('300 g'),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Time'),
                      Text('0:00 min'),
                      Text('0:45 min'),
                      Text('1:15 min'),
                      Text('2:00 min'),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Progress'),
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
  }
}
