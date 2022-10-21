import 'package:flutter/material.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 150,
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
    );
  }
}
