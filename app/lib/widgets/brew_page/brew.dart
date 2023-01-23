import 'package:flutter/material.dart';

import 'package:app/widgets/brew_page/brew_setup.dart';
import 'package:app/widgets/brew_page/brew_profile.dart';
import 'package:app/widgets/brew_page/brew_steps.dart';

class BrewPage extends StatefulWidget {
  const BrewPage({super.key});

  @override
  State<BrewPage> createState() => _BrewPageState();
}

class _BrewPageState extends State<BrewPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Container(
        height: constraints.maxHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: constraints.maxHeight * 0.25,
              child: BrewSetup(),
            ),
            Container(
              height: constraints.maxHeight * 0.15,
              child: BrewProfile(),
            ),
            Container(
              height: constraints.maxHeight * 0.6,
              child: BrewSteps(constraints.maxHeight),
            ),
          ],
        ),
      );
    });
  }
}
