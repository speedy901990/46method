import 'package:flutter/material.dart';

import 'package:app/models/hex_color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BrewSteps extends StatefulWidget {
  final double maxHeight;
  const BrewSteps(this.maxHeight);

  @override
  State<BrewSteps> createState() => _BrewStepsState();
}

class _BrewStepsState extends State<BrewSteps> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Brew Steps',
            style: Theme.of(context).textTheme.headline1,
          ),
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
                Text('0 g', style: Theme.of(context).textTheme.bodyText1),
                Text('100 g', style: Theme.of(context).textTheme.bodyText1),
                Text('200 g', style: Theme.of(context).textTheme.bodyText1),
                Text('300 g', style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
            Column(
              children: [
                Text('Time', style: Theme.of(context).textTheme.headline2),
                Text('0:00 min', style: Theme.of(context).textTheme.bodyText1),
                Text('0:45 min', style: Theme.of(context).textTheme.bodyText1),
                Text('1:15 min', style: Theme.of(context).textTheme.bodyText1),
                Text('2:00 min', style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
            Container(
              height: widget.maxHeight * 0.6 * 0.25, //fixit
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Progress',
                      style: Theme.of(context).textTheme.headline2),
                  FaIcon(FontAwesomeIcons.mugHot)
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
