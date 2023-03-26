import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class PassiveChip extends StatelessWidget {
  const PassiveChip({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: Colors.transparent,
      label: Text(
        text,
        style: context.textTheme.bodyMedium,
      ),
    );
  }
}
