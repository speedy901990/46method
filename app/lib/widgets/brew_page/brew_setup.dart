import 'package:flutter/material.dart';

class BrewSetup extends StatefulWidget {
  const BrewSetup({super.key});

  @override
  State<BrewSetup> createState() => _BrewSetupState();
}

class _BrewSetupState extends State<BrewSetup> {
  var brewSettingSwitchValue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Container(
                  height: 50,
                  width: 50,
                  child: Center(child: Text('Coffee')),
                  color: Colors.blueGrey,
                ),
              ),
              Switch(
                activeTrackColor: Theme.of(context).colorScheme.surface,
                inactiveTrackColor: Theme.of(context).colorScheme.surface,
                activeColor: Theme.of(context).colorScheme.secondary,
                inactiveThumbColor: Theme.of(context).colorScheme.secondary,
                value: brewSettingSwitchValue,
                onChanged: (value) =>
                    setState(() => brewSettingSwitchValue = value),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
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
    );
  }
}
