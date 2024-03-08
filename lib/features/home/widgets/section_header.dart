import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.sectionTitle,
    required this.actionTitle,
    required this.actionIcon,
  });

  final String sectionTitle;
  final String actionTitle;
  final IconData? actionIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          sectionTitle,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        Row(
          children: [
            Text(
              actionTitle,
              style: const TextStyle(
                fontSize: 10,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              actionIcon,
              color: Colors.indigo,
            )
          ],
        )
      ],
    );
  }
}
