import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class BrewProfile extends StatefulWidget {
  const BrewProfile({super.key});

  @override
  State<BrewProfile> createState() => _BrewProfileState();
}

class _BrewProfileState extends State<BrewProfile> {
  final _brewProfileController = GroupButtonController();

  @override
  void initState() {
    _brewProfileController.selectIndex(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'Brewing Profile',
            style: Theme.of(context).textTheme.headline1,
          ),
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
    );
  }
}
