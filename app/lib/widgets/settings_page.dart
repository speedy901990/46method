import 'package:flutter/material.dart';

import 'package:app/models/hex_color.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.settings,
      color: Theme.of(context).colorScheme.secondary,
      size: 160,
    );
  }
}
