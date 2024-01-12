
import 'package:flutter/material.dart';

class SkillContainer extends StatelessWidget {
  final String skill;

  const SkillContainer({super.key, required this.skill});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: theme.colorScheme.secondary, borderRadius: BorderRadius.circular(12)),
      // alignment: Alignment.center,
      child: Text(
        skill,
        style: theme.textTheme.bodyLarge!
            .copyWith(color: theme.colorScheme.onPrimary),
      ),
    );
  }
}
