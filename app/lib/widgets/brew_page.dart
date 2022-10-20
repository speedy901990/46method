import 'package:flutter/material.dart';

import 'package:group_button/group_button.dart';

class BrewPage extends StatelessWidget {
  const BrewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
